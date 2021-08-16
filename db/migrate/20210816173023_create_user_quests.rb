class CreateUserQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_quests do |t|
      t.references :user
      t.references :quest
      t.boolean :is_master, default: false

      t.timestamps
    end
  end
end
