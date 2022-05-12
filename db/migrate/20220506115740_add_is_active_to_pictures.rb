class AddIsActiveToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :is_active, :boolean
  end
end
