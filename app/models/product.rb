class Product < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :orders, :join_table => "order_products"
  has_many :order_products
end
