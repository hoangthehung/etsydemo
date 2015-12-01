class ShoppingCart < ActiveRecord::Base
	acts_as_shopping_cart
	has_many :orders, dependent: :destroy
end
