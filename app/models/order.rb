class Order < ActiveRecord::Base
  belongs_to :shipping_address, :class_name => "Location"
  belongs_to :billing_address, :class_name => "Location"
  belongs_to :user
  has_and_belongs_to_many :products, :join_table => "order_products"
  has_many :order_products
end
