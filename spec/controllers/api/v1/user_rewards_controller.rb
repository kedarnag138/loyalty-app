require 'rails_helper'

describe Api::V1::UserRewardsController, type: :request do

  context "POST #assign_rewards" do

    let(:user) { FactoryBot.create(:user, birthday: "1990-09-02") } 
    let(:reward) { FactoryBot.create(:reward) }
    
    before do
      Point.create(earned: 10, location: "Singapore", user_id: user.id)
      Point.create(earned: 20, location: "India", user_id: user.id)
      Point.create(earned: 20, location: "Vietnam", user_id: user.id)
      Point.create(earned: 20, location: "Indonesia", user_id: user.id)
      Point.create(earned: 20, location: "Malaysia", user_id: user.id)
      Point.create(earned: 10, location: "Singapore", user_id: user.id)
      Reward.create(name: "Free Coffee")
      Reward.create(name: "5% Cash Rebate")
    end
    

    it "should be able to assign free coffee if the user has collected 100 points within a month" do
      post "/api/v1/users/#{user.id}/user_rewards/assign_rewards", params: {}
      response_body = JSON.parse(response.body)
      expect(response_body["data"]["result"]["rewards"].count).to be_eq(1)
      expect(response_body["status"]["code"]).to eq(200)
      expect(response_body["status"]["errorDetail"]).to eq("")
      expect(response_body["status"]["message"]).to eq("OK")
    end

    it "should be able to assign 5% case rebate if the user's birthday is in the month" do
      post "/api/v1/users/#{user.id}/user_rewards/assign_rewards", params: {}
      response_body = JSON.parse(response.body)
      expect(response_body["data"]["result"]["rewards"].count).to be_eq(2)
      expect(response_body["status"]["code"]).to eq(200)
      expect(response_body["status"]["errorDetail"]).to eq("")
      expect(response_body["status"]["message"]).to eq("OK")
    end

  end

end
