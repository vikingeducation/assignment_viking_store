class Product < ActiveRecord::Base

  has_many :carts, through: :carts_products
  belongs_to :carts_products

end
