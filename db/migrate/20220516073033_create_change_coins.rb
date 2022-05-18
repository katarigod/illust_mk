class CreateChangeCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :change_coins do |t|
      t.integer :customer_id
      t.integer :piece
      t.timestamps
    end
  end
end
