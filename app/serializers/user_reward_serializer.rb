class UserRewardSerializer < ActiveModel::Serializer
  attributes :rewards

  def rewards
    self.object.compact.flatten.each do |user_reward|

      user_reward.reward_id.present? ? Reward.find(user_reward.reward_id).name : nil
    end
  end

end
