# == Schema Information
#
# Table name: subs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Sub do
  subject(:sub) { build(:sub) }

  it { should be_valid }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:links) }
  end

  # it 'has owner' do
  #   expect(sub.user).to_not be_nil
  # end

  # it 'has many links' do
#     expect(sub.links.size).to_not be_nil
#   end

  it 'can add a link' do
    sub.links << create(:link)
    expect(sub.links.size).to eq(1)
  end

  describe 'not valid with bogus info' do
    it 'must have title' do
      expect(build(:sub, title: "")).to_not be_valid
    end

    it 'must have owner' do
      expect(build(:sub, user_id: nil)).to_not be_valid
    end




  end


end
