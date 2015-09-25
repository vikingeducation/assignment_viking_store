class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipment
  has_many :items, :class_name => 'OrderItem'
end
