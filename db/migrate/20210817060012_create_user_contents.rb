class CreateUserContents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_contents do |t|
      t.references :user, foreign_key: true
      t.references :content, foreign_key: true
      t.boolean :is_finished, default: false

      t.timestamps
    end
  end
end
