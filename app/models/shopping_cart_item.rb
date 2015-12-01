class ShoppingCartItem < ActiveRecord::Base
	has_and_belongs_to_many :orders
	acts_as_shopping_cart_item
end
