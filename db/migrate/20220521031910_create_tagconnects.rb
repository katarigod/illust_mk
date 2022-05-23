class CreateTagconnects < ActiveRecord::Migration[6.1]
  def change
    create_table :tagconnects do |t|
      t.integer :customer_id
      t.integer :picture_id
      t.timestamps
    end
  end
end
