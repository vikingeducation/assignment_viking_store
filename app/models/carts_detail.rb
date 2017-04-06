class CartsDetail < ApplicationRecord

  has_many :carts_details
  has_many :products

end