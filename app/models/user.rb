class User < ActiveRecord::Base
  has_many :credit_cards
  has_many :billing_addresses
  has_many :shipping_addresses
  has_many :carts
  has_many :orders
end
