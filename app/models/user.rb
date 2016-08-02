class User < ApplicationRecord
  has_many :addresses
  has_one :cards
  has_many :orders
end
