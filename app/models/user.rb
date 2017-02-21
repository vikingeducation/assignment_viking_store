class User < ApplicationRecord
  has_many :addresses
  has_many :orders
  has_many :credit_cards
  has_one :default_address
  has_many :order_items, through: :orders
  has_many :products, through: :order_items
end
