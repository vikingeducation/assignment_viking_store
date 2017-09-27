class Product < ApplicationRecord
  belongs_to :category

  has_many :product_carts
  has_many :carts, through: :product_carts
end
