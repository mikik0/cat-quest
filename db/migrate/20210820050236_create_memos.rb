class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.references :user, foreign_key: true
      t.references :content, foreign_key: true
      t.text :text
      t.integer :time
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end
