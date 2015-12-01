class Link < ActiveRecord::Base
	
	has_many :listings
	belongs_to :provider
	
end
