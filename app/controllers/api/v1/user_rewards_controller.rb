class Api::V1::UserRewardsController < ApplicationController

  def assign_rewards
    rewards = []
    in_a_month = check_if_user_has_collected_100_points_in_a_month
    birthday_month = check_for_user_birthday
    rewards.push(in_a_month, birthday_month)
    show_entity(rewards)
  end

  def serializer
    UserRewardSerializer
  end

  private

  def check_if_user_has_collected_100_points_in_a_month
    @points = Point.in_a_month(params[:user_id])
    if @points.all.pluck(:earned).sum == 100
      @user_reward = UserReward.assign_free_coffee(params[:user_id])
    end
  end

  def check_for_user_birthday
    @user_reward = User.birthday_this_month(params[:user_id])
  end

end