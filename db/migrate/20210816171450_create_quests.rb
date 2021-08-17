class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :title
      t.text   :description
      t.string :meeting_link
      t.datetime :meeting_held_at
      t.datetime :strated_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end