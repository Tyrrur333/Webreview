class RemoveTimestamsFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :created_at, :timestamp
    remove_column :categories, :updated_at, :timestamp
  end
end
