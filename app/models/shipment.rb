class Shipment < ActiveRecord::Base
  has_many :orders
  has_one :destination, :class_name => 'Address'
end
