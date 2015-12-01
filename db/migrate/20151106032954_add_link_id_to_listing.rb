class AddLinkIdToListing < ActiveRecord::Migration
  def change
    add_column :listings, :linkId, :integer
  end
end
