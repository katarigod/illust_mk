class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.integer :customer_id
      t.integer :price
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
