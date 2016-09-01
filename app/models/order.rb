class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shipment
  has_many :items, :class_name => 'OrderItem'
end
