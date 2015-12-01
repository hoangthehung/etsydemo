class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :p_name
      t.string :p_image
      t.string :p_price
      t.string :p_des
      t.string :item
      t.integer :item_type
      t.integer :keyword_type

      t.timestamps null: false
    end
  end
end
