class User < ActiveRecord::Base
  has_many :credit_cards
  has_many :addresses
  # TODO: change to has_one cart once cart-to-order process properly set up
  has_many :carts
  has_many :orders
end
