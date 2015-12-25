class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipping_address
  belongs_to :billing_address
  belongs_to :credit_card
  has_many :line_items
end
