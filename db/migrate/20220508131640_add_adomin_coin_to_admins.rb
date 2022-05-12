class AddAdominCoinToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :admin_coin, :integer, default: 0
  end
end
