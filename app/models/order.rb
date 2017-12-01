class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :order_items

  has_many :order_items, dependent: :destroy
  has_many :items, foreign_key: 'order_id', class_name: 'OrderItem'
end
