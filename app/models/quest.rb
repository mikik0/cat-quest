class Quest < ApplicationRecord
  has_many :user_quests, dependent: :destroy
  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :contents, allow_destroy: true

  def current_quest?
     finished_at > Time.now
  end

  def user_questsed_by?(user)
    user_quests.exists?(user_id: user.id)
  end

end
