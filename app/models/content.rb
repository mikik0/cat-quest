class Content < ApplicationRecord
	belongs_to :quest
	has_many :user_contents, dependent: :destroy
	has_many :memos
	has_many :tag_contents, dependent: :destroy
	has_many :tags, through: :tag_contents
end
