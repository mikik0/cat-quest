class CreateTechTagEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :tech_tag_events do |t|
      t.integer :content_id
      t.string :youtube_url

      t.timestamps
    end
  end
end
