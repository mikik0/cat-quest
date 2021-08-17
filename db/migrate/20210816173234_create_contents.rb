class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :quest, foreign_key: true
      t.string :youtube_url
      t.string :title
      #後でタグ用のカラム追加

      t.timestamps
    end
  end
end
