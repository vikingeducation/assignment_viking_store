class Cart < ApplicationRecord
  # belongs_to :credit_cart
  has_many :products, class_name: 'ProductCart'
  enum status: [:open_order, :paid, :shipped]
end
