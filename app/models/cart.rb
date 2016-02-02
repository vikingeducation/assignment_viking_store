class Cart < ActiveRecord::Base

  has_many :products, through: :carts_products
  belongs_to :carts_products


end
