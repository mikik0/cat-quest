class Quest < ApplicationRecord
  has_many :contents
	has_many :user_quests, through: :contents

  def current_quest?
     finished_at > Time.now
  end

end
