FactoryBot.define do
  factory :user_reward do
    reward_status { false }
    association :user
    association :reward
  end
end