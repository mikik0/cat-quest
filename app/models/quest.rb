class Quest < ApplicationRecord
  has_many :user_quests

  def current_quest?
     finished_at > Time.now
  end

end
