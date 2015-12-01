class Order < ActiveRecord::Base
	has_and_belongs_to_many :shopping_cart_items
	
	validates :address, :city, :state, presence: true
	
	belongs_to :buyer, class_name: "User"
	belongs_to :seller, class_name: "User" 

	belongs_to :shopping_cart
end
