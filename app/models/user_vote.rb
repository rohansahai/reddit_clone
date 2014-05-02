class UserVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates_presence_of :user, :link
  # doesn't work on link nil, second validation is not lazy
  validate :link_user_unique

  def link_user_unique
    # needs to add errors to array of recorded errors
    link_user_pars = UserVote.where(:user_id => self.user_id, :link_id => self.link_id)
    if !!self.link && !link_user_pars.empty?
      errors.add(:user_vote, "unique bro")
    end
  end
end
