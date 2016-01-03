class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'
  belongs_to :credit_card
  has_many :line_items
  has_many :products, through: :line_items
end
