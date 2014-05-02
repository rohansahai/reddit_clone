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

  validates_presence_of :title, :url, :user
end
