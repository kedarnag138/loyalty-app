class UserReward < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :reward

  def self.assign_free_coffee(user_id)
    @user_reward = UserReward.where(user_id: user_id, reward_id: Reward.find_by(name: "Free Coffee").id, reward_status: true)
    unless @user_reward.present?
      @user_reward = UserReward.create(user_id: user_id, reward_id: Reward.find_by(name: "Free Coffee").id)
      @user_reward.update_attribute(:reward_status, true)
    end
    @user_reward
  end

end