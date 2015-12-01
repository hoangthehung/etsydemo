class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :showHome
      t.integer :rank
      t.integer :level
      t.references :parent, index: true

      t.timestamps null: false
    end
    add_foreign_key :categories, :parents
  end
end
