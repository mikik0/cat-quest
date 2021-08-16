class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :title
      t.string :description
      t.datetime :time_limit
      t.datetime :started_at

      t.timestamps
    end
  end
end
