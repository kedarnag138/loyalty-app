class AddUserAndRewardReferencesToUserReward < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_rewards, :user, foreign_key: true
    add_reference :user_rewards, :reward, foreign_key: true
  end
end
