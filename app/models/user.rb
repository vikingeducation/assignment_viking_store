class User < ActiveRecord::Base
  has_many :credit_cards
  has_many :addresses
  has_many :carts
  has_many :orders
end
