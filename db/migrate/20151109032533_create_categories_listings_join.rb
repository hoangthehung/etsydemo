class CreateCategoriesListingsJoin < ActiveRecord::Migration
  def self.up
    create_table :categories_listings, :id => false do |t|
      t.integer :category_id
      t.integer :listing_id
    end

    add_index :categories_listings, [:category_id, :listing_id]
  end

  def self.down
    drop_table :categories_listings
  end
end
