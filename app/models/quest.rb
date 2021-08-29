class Quest < ApplicationRecord
  has_many :user_quests, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :user_contents, through: :contents
  accepts_nested_attributes_for :contents, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true
  validate :finished_check

  def finished_check
    errors.add(:finished_at, "は現在より前の日付で登録できません。") if
      self.finished_at < Time.current
  end


  scope :content_ids, -> { contents.pluck(:id) }

  def finished?(user)
    finished_flag = true
    content_ids.each do | id |
      if UserContent.find_by(user_id: user.id, content_id: id).nil?
        finished_flag = false
      end
    end
    return finished_flag
  end

  # クエストクリアした際にもらえる猫缶算出
  def total_nekokan(user)
    total_nekokan = user_contents.where(user_id: user.id).inject(0) do | total_nekokan, user_content |
      total_nekokan += user_content.nekokan
    end
  end

  def current_quest?
    finished_at > Time.now
  end

  def user_questsed_by?(user)
    user_quests.exists?(user_id: user.id)
  end

end
