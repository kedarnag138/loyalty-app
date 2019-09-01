require 'rails_helper'

describe Api::V1::UsersController, type: :request do

  context "GET #index" do

    it "should list all the users" do
      expected_json = users
      get "/api/v1/users", params: {}
      response_body = JSON.parse(response.body)
      expect(response_body).to match_json_expression(expected_json)
    end

    it "should not list users if none are present" do
      get "/api/v1/users", params: {}
      response_body = JSON.parse(response.body)
      expect(response_body["status"]["code"]).to eq(204)
      expect(response_body["status"]["errorDetail"]).to eq("Nothing to display")
      expect(response_body["status"]["message"]).to eq("NO CONTENT")
    end

  end

  context "POST #create" do

    it "should be able to create a user" do
      user_params = {
        "user": {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          birthday: Faker::Date.birthday(min_age: 1, max_age: 99),
          email: Faker::Internet.email
        }
      }
      post "/api/v1/users", params: user_params
      response_body = JSON.parse(response.body)
      expect(response_body["status"]["code"]).to eq(200)
      expect(response_body["status"]["errorDetail"]).to eq("")
      expect(response_body["status"]["message"]).to eq("OK")
    end

    it "should not able to create a user if validation fails" do
      user_params = {
        "user": {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          birthday: "",
          email: Faker::Internet.email
        }
      }
      post "/api/v1/users", params: user_params
      response_body = JSON.parse(response.body)
      expect(response_body["status"]["code"]).to eq(422)
      expect(response_body["status"]["errorDetail"]).to eq("Birthday can't be blank")
      expect(response_body["status"]["message"]).to eq("VALIDATION FAILED")
    end

  end

end