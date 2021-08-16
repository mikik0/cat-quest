class CreateNekocans < ActiveRecord::Migration[5.2]
  def change
    create_table :nekocans do |t|
      t.references :user, foreign_key: true
      t.datetime :date
      t.string :nekocan

      t.timestamps
    end
  end
end
