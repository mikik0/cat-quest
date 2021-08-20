class CreateNekocans < ActiveRecord::Migration[5.2]
  def change
    create_table :nekokans do |t|
      t.references :user, foreign_key: true
      t.date :acquired_at
      t.string :nekocan

      t.timestamps
    end
  end
end
