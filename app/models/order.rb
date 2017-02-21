class Order < ApplicationRecord
  belongs_to :user
  has_one :address
  has_many :order_items
  has_many :products, through: :order_items
end
