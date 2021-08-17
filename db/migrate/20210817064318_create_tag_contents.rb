class CreateTagContents < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_contents do |t|
      t.references :tag, foreign_key: true
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
