class Character < ApplicationRecord
  has_many :users

  def self.select(level)
    where(level: level).pluck(:id).sample
  end

  def self.level_table
    pluck(:level).uniq.sort
  end
end
