class CreateBuycoins < ActiveRecord::Migration[6.1]
  def change
    create_table :buycoins do |t|

      t.integer :customer_id
      t.integer :piece
      t.boolean :yet_buy, default: true
      t.timestamps
    end
  end
end
