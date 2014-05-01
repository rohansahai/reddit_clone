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

require 'spec_helper'

describe User do


  subject(:user) { build(:user) }
  let(:first_user) { create(:user) }
  let(:current_user) { User.find_by_token(first_user.token) }
  let(:bad_token) { User.find_by_token('dsfargeg') }

  it { should be_valid}

  # test for find_by_token

  it 'finds users by token' do
    expect(first_user).to eq(current_user)
  end

  it 'fails to find non-tokens' do
    bad_token.should be_nil
  end

  it 'finds users by username and password' do
    expect(first_user).to eq(User.find_by_credentials(
    username: first_user.username,
    password: first_user.password))
  end

  it 'fails with an incorrect password' do
    expect(User.find_by_credentials(
    username: first_user.username, password: 'WRONG PASS'))
    .to eq false
  end

  # test for finding by username and password
end
