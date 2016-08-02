class Order < ActiveRecord::Base
  has_many :shipments
  has_many :products
end
