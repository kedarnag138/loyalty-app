require 'rails_helper'

describe User, type: :model do

  it "should be a valid user" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "should require a first_name" do
    expect(FactoryBot.build(:user, first_name: "")).not_to be_valid
  end

  it "should require a last_name" do
    expect(FactoryBot.build(:user, last_name: "")).not_to be_valid
  end

  it "should require a birthday" do
    expect(FactoryBot.build(:user, birthday: "")).not_to be_valid
  end

  context "email" do
    
    let(:user) { FactoryBot.create(:user) }
  
    it "should accept valid email addresses on create" do
      valid_emails = %w[user@foo.com THE_user@foo.bar.org first.last@foo.jp test@yopmail2.com test@222test.com testing@yopmail22.com2 test@2yop2.io]
      valid_emails.each do |valid_email|
        user.email = valid_email
        expect(user).to be_valid
      end
    end
  
    it "should reject invalid email addresses" do
      invalid_emails = %w[user@foo,com user_at_foo.org example.user@foo.]
      invalid_emails.each do |invalid_email|
        user.email = invalid_email
        expect(user).to be_invalid
      end
    end

  end

end