class AddProviderIdToLink < ActiveRecord::Migration
  def change
  	add_column :links, :provider_id, :integer
  end
end
