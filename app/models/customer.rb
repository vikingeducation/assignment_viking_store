class Customer < ApplicationRecord

  has_many :addresses
  has_many :products
  has_many :carts_details
  
end
