class Quest < ApplicationRecord
  has_many :user_quests
  has_many :contents
  accepts_nested_attributes_for :contents

  def current_quest?
     finished_at > Time.now
  end

end
