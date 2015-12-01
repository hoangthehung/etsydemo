class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :description
      t.string :fb_page

      t.timestamps null: false
    end
  end
end
