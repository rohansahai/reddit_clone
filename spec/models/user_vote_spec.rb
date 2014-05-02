require 'spec_helper'

describe UserVote do
  subject(:user_vote) { create(:user_vote) }
  let(:link) { create(:link) }
  let(:user) { create(:user) }
  let(:unsaved_vote) { build(:user_vote) }

  it { should be_valid }


  describe 'belongs to a link and user' do
    it { should belong_to :link}
    it { should belong_to :user}
  end

  # it { should validate_presence_of :link }
  # it { should validate_presence_of :user }

  it 'validates user presence' do
    unsaved_vote.user = nil
    expect(unsaved_vote).to_not be_valid
  end

  it 'validates link presence' do
    unsaved_vote.link = nil
    expect(unsaved_vote).to_not be_valid
  end




  # 3.times do |n|
  #   let("vote#{n}") { create(:user_vote) }
  #   it { should be_valid }
  # end

  it 'link can be upvoted by 3 users' do
    3.times do |n|
      create(:user_vote, link: link)
    end
    expect(link.upvotes).to eq(3)
  end

  it 'forbids double votes' do
      create(:user_vote, user: user, link: link)
      build(:user_vote, user: user, link: link)
      should_not be_valid
  end



end
