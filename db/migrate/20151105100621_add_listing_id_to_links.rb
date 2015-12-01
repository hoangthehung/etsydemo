class AddListingIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :listingId, :integer
  end
end
