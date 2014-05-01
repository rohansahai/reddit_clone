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
#  sub_id     :integer
#  body       :text
#

class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub

  has_many :comments

  validates_presence_of :title, :url, :user
end
