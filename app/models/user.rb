class User < ApplicationRecord
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :carts
end
