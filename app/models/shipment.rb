class Shipment < ActiveRecord::Base
  belongs_to :order
  belongs_to :address
end
