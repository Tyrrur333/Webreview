class AddApppostidToAppposts < ActiveRecord::Migration[5.2]
  def change
    add_column :appposts, :apppost_id, :integer
  end
end
