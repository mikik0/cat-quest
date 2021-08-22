class Content < ApplicationRecord
	belongs_to :quest
	has_many :user_contents, dependent: :destroy
	has_many :memos
end
