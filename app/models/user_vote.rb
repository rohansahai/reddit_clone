class UserVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates_presence_of :link, :user
end
