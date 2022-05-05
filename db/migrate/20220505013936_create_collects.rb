class CreateCollects < ActiveRecord::Migration[6.1]
  def change
    create_table :collects do |t|
      t.integer :customer_id
      t.integer :picture_id
      t.timestamps
    end
  end
end
