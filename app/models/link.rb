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

class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub

  has_many :comments
  has_many :link_subs, inverse_of: :link
  has_many :subs, through: :link_subs, inverse_of: :links

  has_many :user_votes


  validates_presence_of :title, :url, :user

  def upvotes
    self.user_votes.where(:upvote => true).count
  end

  def downvotes
    self.user_votes.where(:upvote => false).count
  end
end
