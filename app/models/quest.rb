class Quest < ApplicationRecord
  has_many :user_quests
  has_many :contents, dependent: :destroy

  def current_quest?
     finished_at > Time.now
  end

  def user_questsed_by?(user)
    user_quests.exists?(user_id: user.id)
  end

end
