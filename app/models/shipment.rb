class Shipment < ApplicationRecord
  has_many :orders
  has_one :destination, :class_name => 'Address'
end
