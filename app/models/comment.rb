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

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  belongs_to :comment

  has_many :comments

  validates_presence_of :body, :user, :link
end
