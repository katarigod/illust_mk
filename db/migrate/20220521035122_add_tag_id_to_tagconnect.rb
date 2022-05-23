class AddTagIdToTagconnect < ActiveRecord::Migration[6.1]
  def change
    add_column :tagconnects, :tag_id, :integer
  end
end
