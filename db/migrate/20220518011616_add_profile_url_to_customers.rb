class AddProfileUrlToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :profile_url, :text
  end
end
