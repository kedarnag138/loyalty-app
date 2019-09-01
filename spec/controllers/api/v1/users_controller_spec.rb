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

end