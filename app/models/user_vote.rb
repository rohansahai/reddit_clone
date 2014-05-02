class UserVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates_presence_of :user
  # doesn't work on link nil, second validation is not lazy
  validate :link_present_and_unique

  def link_present_and_unique
    # needs to add errors to array of recorded errors
    !!self.link
  end
end
