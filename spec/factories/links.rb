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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    user_id { FactoryGirl.create(:user).id }
    title Faker::Company.catch_phrase
    url "http://google.com"
  end
end
