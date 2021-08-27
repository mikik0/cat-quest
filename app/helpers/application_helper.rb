module ApplicationHelper
  def rand_chara
    Character.where(level: 1).pluck(:id).sample
  end
end
