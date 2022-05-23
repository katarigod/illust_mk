class RemoveCustomerIdFromTagconnect < ActiveRecord::Migration[6.1]
  def change
    remove_column :tagconnects, :customer_id, :integer
  end
end
