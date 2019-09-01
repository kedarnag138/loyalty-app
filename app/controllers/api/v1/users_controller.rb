class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render_objects(@users, User)
  end

  def create
    @user = User.new(user_params)
    create_entity(@user)
  end

  def serializer
    UserSerializer
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :email)
  end

end