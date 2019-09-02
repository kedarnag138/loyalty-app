class User < ApplicationRecord

  # Associations
  has_many :transactions
  has_many :points
  has_many :user_rewards
  has_many :rewards, through: :user_rewards

  validates_presence_of :first_name, :last_name, :birthday
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9!@#$%^&*()]+\.)+[a-z0-9!@#$%^&*()]{2,})\z/i, message: :invalid_email_format

  def self.birthday_this_month(user_id)
    user = User.find(user_id)
    @user_reward = UserReward.where(user_id: user_id, reward_id: Reward.find_by(name: "5% Cash Rebate").id, reward_status: true)
    unless @user_reward.present?
      if user.birthday.strftime("%m") == Date.today.strftime("%m")
        @user_reward = UserReward.create(user_id: user_id, reward_id: Reward.find_by(name: "5% Cash Rebate").id)
        @user_reward.update_attribute(:reward_status, true)
      end
    end
    @user_reward
  end

end