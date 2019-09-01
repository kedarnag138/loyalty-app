require 'rails_helper'

describe Api::V1::TransactionsController, type: :request do

  context "POST #create" do

    let(:user) { FactoryBot.create(:user) } 

    it "should be able to create a transaction" do
      transaction_params = {
        "transaction": {
          user_id: user.id,
          latitude: "1.352804",
          longitude: "103.952302",
          amount: rand(100..9999)
        }
      }
      post "/api/v1/users/#{user.id}/transactions", params: transaction_params
      response_body = JSON.parse(response.body)
      expect(response_body["status"]["code"]).to eq(200)
      expect(response_body["status"]["errorDetail"]).to eq("")
      expect(response_body["status"]["message"]).to eq("OK")
      expect(Point.count).to eq(1)
    end

    it "should be able to create a transaction but not assign points if the amount spent is less than 100 within singapore" do
      transaction_params = {
        "transaction": {
          user_id: user.id,
          latitude: "1.352804",
          longitude: "103.952302",
          amount: rand(1..99)
        }
      }
      post "/api/v1/users/#{user.id}/transactions", params: transaction_params
      response_body = JSON.parse(response.body)
      expect(response_body["status"]["code"]).to eq(200)
      expect(response_body["status"]["errorDetail"]).to eq("")
      expect(response_body["status"]["message"]).to eq("OK")
      expect(Point.count).to eq(0)
    end

    it "should be able to create a transaction and assign twice the points if the amount is spent in a foreign country" do
      transaction_params = {
        "transaction": {
          user_id: user.id,
          latitude: "13.033861",
          longitude: "77.550139",
          amount: rand(1..9999)
        }
      }
      post "/api/v1/users/#{user.id}/transactions", params: transaction_params
      response_body = JSON.parse(response.body)
      expect(response_body["status"]["code"]).to eq(200)
      expect(response_body["status"]["errorDetail"]).to eq("")
      expect(response_body["status"]["message"]).to eq("OK")
      point = Point.last
      expect{point.earned}.to change(point, :earned).by_at_most(20)
    end

    it "should not be able create a transaction if the latitude and longitude are invalid" do
      transaction_params = {
        "transaction": {
          user_id: user.id,
          latitude: "-13.739172",
          longitude: "60.027036",
          amount: rand(100..9999)
        }
      }
      post "/api/v1/users/#{user.id}/transactions", params: transaction_params
      response_body = JSON.parse(response.body)
      expect(response_body["status"]["code"]).to eq(422)
      expect(response_body["status"]["errorDetail"]).to eq("Unable to geocode")
      expect(response_body["status"]["message"]).to eq("VALIDATION FAILED")
    end

  end

end
