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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    user_id { FactoryGirl.create(:user).id }
    title { Faker::Company.name }
  end
end
