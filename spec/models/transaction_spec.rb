require 'rails_helper'

describe Transaction, type: :model do

  let(:user) { FactoryBot.create(:user) }
  let(:transaction) { FactoryBot.create(:transaction, user_id: user.id, latitude: "11.676445", longitude: "78.131845") }  

  it "should be a valid transaction" do
    user = FactoryBot.create(:user)
    expect(FactoryBot.build(:transaction, user_id: user.id, latitude: "11.676445", longitude: "78.131845")).to be_valid
  end

  it "should require a amount" do
    expect(FactoryBot.build(:transaction, amount: "")).not_to be_valid
  end

  it "should belong to user" do
    expect(transaction).to respond_to :user
  end

end