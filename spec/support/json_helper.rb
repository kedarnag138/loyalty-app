module JsonHelper

  def users
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    expected_json = {
      "data": {
        "results" => [{
          "id": @user1.id,
          "first_name": @user1.first_name,
          "last_name": @user1.last_name,
          "birthday": @user1.birthday.strftime("%Y-%m-%d"),
          "email": @user1.email
        },
        {
          "id": @user2.id,
          "first_name": @user2.first_name,
          "last_name": @user2.last_name,
          "birthday": @user2.birthday.strftime("%Y-%m-%d"),
          "email": @user2.email
        }]
      },
      "status": {
        "code": 200,
        "errorDetail": "",
        "message": "OK"
      }
    }
  end

end