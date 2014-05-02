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

class Sub < ActiveRecord::Base
  MIN_TITLE_LEN = 3
  validates :title, :length => { :minimum => MIN_TITLE_LEN }
  validates_presence_of :user

  belongs_to :user

  has_many :link_subs, inverse_of: :sub
  has_many :links, through: :link_subs, inverse_of: :subs


  # def to_s
  #   'test'
  # end
  #
  # def inspect
  #   'this is a sub'
  # end

end
