require 'rails_helper'

describe Reward, type: :model do

  it "should have many user_rewards" do
    expect(Reward.reflect_on_association(:user_rewards).macro).to eq :has_many
  end

  it "should have many users through user_rewards" do
    reward = FactoryBot.create(:reward)
    user = FactoryBot.create(:user)

    reward.users << user

    expect(UserReward.first.reward).to eq(reward)
    expect(UserReward.first.user).to eq(user)
  end

end