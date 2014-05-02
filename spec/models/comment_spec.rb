# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  link_id    :integer
#  comment_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Comment do

  subject(:comment) {build :comment}

  it { should be_valid } # tests factory girl base

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should belong_to(:link)}
  end

  %w(body user link).each do |el|
    it { should validate_presence_of el }
  end

  it "can set body" do
    c = create(:comment, body: "arbitrary")
    expect(Comment.last.body).to eq(c.body)
  end

  it "can add a reply" do
    reply = create(:comment, body: "this is a reply")
    comment.comments << reply
    comment.save
    expect(comment.comments.size).to eq 1
    expect(reply.comment).to eq comment
  end

end
