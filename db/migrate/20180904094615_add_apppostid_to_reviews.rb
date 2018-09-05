class AddApppostidToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :apppost_id, :integer
  end
end
