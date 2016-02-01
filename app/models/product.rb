class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  has_many :shopping_cart_items
end
