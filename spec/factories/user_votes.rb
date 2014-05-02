# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_vote do
    user {FactoryGirl.create(:user)}
    link {FactoryGirl.create(:link)}
    upvote true
  end
end
