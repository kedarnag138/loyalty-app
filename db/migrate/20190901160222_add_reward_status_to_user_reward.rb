class AddRewardStatusToUserReward < ActiveRecord::Migration[5.2]
  def change
    add_column :user_rewards, :reward_status, :boolean, default: false
  end
end