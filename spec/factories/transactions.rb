FactoryBot.define do
  factory :transaction do
    transaction_date { DateTime.now }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    amount { rand(1..9999) }
  end
end