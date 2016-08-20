class ShoppingCart < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_many :cart_products
end
