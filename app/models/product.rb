class Product < ActiveRecord::Base
  has_many :orders
  has_many :orders, through: :order_contents
end
