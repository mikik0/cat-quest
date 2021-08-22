class Quest < ApplicationRecord
	has_many :contents
	has_many :user_quests, through: :contents
	has_many :user_contents
end
