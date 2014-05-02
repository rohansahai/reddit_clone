# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  body       :text
#

require 'spec_helper'

describe Link do

  subject(:link) {build :link}

  it { should be_valid } # tests factory girl base

  describe "associations" do
    it { should have_many(:subs) }
    it { should have_many(:comments) }
    it { should have_many(:upvotes) }
    it {  should have_many(:downvotes) }
  end


  %w(title url user).each do |el|
    it { should validate_presence_of el }
  end

  it 'can have body text' do
    link.body = 'test text'
    expect(link.body).to eq('test text')
  end

end
