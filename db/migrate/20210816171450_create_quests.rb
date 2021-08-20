class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :title
      t.text   :description
      t.integer :total_video_time
      t.time :strated_at
      t.time :finished_at

      t.timestamps
    end
  end
end
