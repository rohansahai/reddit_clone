require 'spec_helper'

describe UserVote do
  subject(:user_vote) { create(:user_vote) }
  let(:link) { create(:link) }

  it { should be_valid }


  describe 'belongs to a link and user' do
    it { should belong_to :link}
    it { should belong_to :user}
  end

  %w(link user).each do |el|
    it { should validate_presence_of el }
  end


end
