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
