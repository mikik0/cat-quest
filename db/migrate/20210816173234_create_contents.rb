class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :quest, foreign_key: true
      t.string :youtube_url
      t.string :video_time

      t.timestamps
    end
  end
end
