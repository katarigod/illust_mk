class ChangeCoinCustomers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :customers, :coin, to: 0
  end
end
