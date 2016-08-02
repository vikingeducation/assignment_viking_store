class User < ActiveRecord::Base
  has_many :orders
  has_many :addresses
  has_many :credit_cards
  has_many :phone_numbers
end
