class AddProfileIdToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :profile_id, :integer
  end
end
