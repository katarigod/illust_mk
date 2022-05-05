class AddCoinToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :coin, :integer
  end
end
