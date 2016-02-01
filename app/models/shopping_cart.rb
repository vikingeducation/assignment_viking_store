class ShoppingCart < ActiveRecord::Base
  belongs_to :user
  has_many :shopping_cart_items
end
