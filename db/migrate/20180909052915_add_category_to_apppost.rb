class AddCategoryToApppost < ActiveRecord::Migration[5.2]
  def change
    # add_column :appposts, :category_id, :integer
  end

  def self.up
    add_column(:posts, :category_id, :integer)
    add_index(:posts, :category_id)
  end

  def self.down
    remove_index(:posts, :column => :category_id)
    remove_column(:posts, :category_id)
  end
end
