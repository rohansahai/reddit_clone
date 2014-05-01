# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  token           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :token

  before_validation :ensure_session_token


  def token!
    self.token = SecureRandom.hex
    save!
    token
  end

  def to_s
    username
  end

  def self.find_by_credentials(cred_hash)
    User.find_by_username(cred_hash[:username])
    .try(:authenticate, cred_hash[:password])
  end

  def ensure_session_token
    self.token ||= SecureRandom.hex
  end

end
