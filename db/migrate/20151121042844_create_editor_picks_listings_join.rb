class CreateEditorPicksListingsJoin < ActiveRecord::Migration
  
def self.up
    create_table :editor_picks_listings, :id => false do |t|
      t.integer :editor_pick_id
      t.integer :listing_id
    end

    add_index :editor_picks_listings, [:editor_pick_id, :listing_id]
  end

  def self.down
    drop_table :editor_picks_listings
  end
  
end
