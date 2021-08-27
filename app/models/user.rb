class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]

  belongs_to :character
  has_many :user_quests, dependent: :destroy
  has_many :quests, through: :user_quests
  has_many :user_contents
  has_many :nekokans
  has_many :memos
  has_many :goods

  validates :name, presence: true, uniqueness: true


  # userが持っているクエストを現在のものと終わっているものに分けるメソッド
  def quest_time_sort
    current_quest = Array.new
    past_quest = Array.new
    quests.each do |quest|
      if quest.current_quest?
        current_quest.push(quest)
      else
        past_quest.push(quest)
      end
    end
    return current_quest,past_quest
  end

  # 現在進行中のクエストがあるか
  def has_current_quest?
    current_quest,past_quest = quest_time_sort
    current_quest.present?
  end

  # userの現在のレベル
  def current_level
    level = 1 < character.level ? character.level : 1
    threshold = LevelThreshold.find_by(level: level + 1).threshold
    while threshold <= total_nekokan
      level += 1
      threshold = LevelThreshold.find_by(level: level).threshold
    end
    return level
  end

  # userの持つcharacterのレベル
  def current_character_level
    table = Character.level_table
    user_level = current_level
    count = table.inject(-1) do | count, level |
      if level <= user_level
        count += 1
      end
      count
    end
    return table[count]
  end

  # userの経験値取得
  def get_nekokan(nekokan)
    nekokans.create(nekokan: nekokan, acquired_at: Date.current)
    self.total_nekokan += nekokan
    chara_level = self.current_character_level
    if chara_level != self.character.level
      self.character_id = Character.select(chara_level)
    end
    self.save
  end

  # userがクエストのオーナーかどうか
  def owner?(quest_id)
    quest = user_quests.find_by(quest_id: quest_id) 
    quest.present? && quest.is_owner
  end

  # No use email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
