class CreateUserQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_quests do |t|
      t.references :user, foreign_key: true
      t.references :quest, foreign_key: true
      t.boolean :is_owner, default: false

      t.timestamps
    end
  end
end
