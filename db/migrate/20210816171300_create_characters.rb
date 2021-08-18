class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :level
      t.string :name
      t.string :image_id

      t.timestamps
    end
  end
end
