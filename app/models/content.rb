class Content < ApplicationRecord
	belongs_to :quest
	has_many :user_contents, dependent: :destroy
	has_many :memos, dependent: :destroy

	validates :youtube_url, presence: true

	def movie_finished?(user)
		UserContent.where(user_id: user.id, content_id: self.id).present?
	end
end
