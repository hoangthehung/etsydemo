class RemoveListingFromOrder < ActiveRecord::Migration
  def self.up
  remove_column :orders, :listing_id
  end
  def self.down
  add_column :orders, :listing, :integer
end
end
