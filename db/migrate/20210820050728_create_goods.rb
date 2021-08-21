class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.references :user, foreign_key: true
      t.references :memo, foreign_key: true

      t.timestamps
    end
  end
end
