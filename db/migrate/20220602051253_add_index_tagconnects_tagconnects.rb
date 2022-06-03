class AddIndexTagconnectsTagconnects < ActiveRecord::Migration[6.1]
  def change
    add_index :tagconnects, [:picture_id, :tag_id], unique: true
  end
end
