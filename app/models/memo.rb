class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :content
  has_many :goods

  validates :text, presence: true

  def favorited_by?(user)
    Good.where(user_id: user.id, memo_id: self.id).exists?
  end
end
