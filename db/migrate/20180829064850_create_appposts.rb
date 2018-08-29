class CreateAppposts < ActiveRecord::Migration[5.2]
  def change
    create_table :appposts do |t|
      t.string :app_name
      t.string :app_image
      t.string :category
      t.text :url
      t.string :author
      t.text :description

      t.timestamps
    end
  end
end
