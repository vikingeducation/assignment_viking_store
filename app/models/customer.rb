class Customer < ActiveRecord::Base
  has_many :shipping_addresses
  has_many :billing_addresses
  has_many :orders
  has_and_belongs_to_many :products
end
