class Quest < ApplicationRecord
  has_many :user_quests
  has_many :contents

  def current_quest?
     finished_at > Time.now
  end

end
