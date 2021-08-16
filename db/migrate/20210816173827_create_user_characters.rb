class CreateUserCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_characters do |t|
      t.references :user
      t.references :character

      t.timestamps
    end
  end
end
