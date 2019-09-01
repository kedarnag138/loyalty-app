require 'securerandom'
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 1, max_age: 99) }
    email { Faker::Internet.email }
  end
end