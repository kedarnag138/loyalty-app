require 'rails_helper'

describe UserReward, type: :model do

  let(:user) { FactoryBot.create(:user) }
  let(:reward) { FactoryBot.create(:reward) }
  let(:user_reward) { FactoryBot.create(:user_reward) } 

  it "should belong to user" do
    expect(user_reward).to respond_to :user
  end

  it "should belong to reward" do
    expect(user_reward).to respond_to :reward
  end

end