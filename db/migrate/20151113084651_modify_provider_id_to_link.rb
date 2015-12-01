class ModifyProviderIdToLink < ActiveRecord::Migration
  def change
  	rename_column :links,:listingId, :provider_id
  end
end
