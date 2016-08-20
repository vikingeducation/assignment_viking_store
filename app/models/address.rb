class Address < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :state

  has_many :orders_billed_here,
           class_name: "Order",
           foreign_key: :billing_id

  has_many :orders_shipped_here,
           class_name: "Order",
           foreign_key: :shipping_id

  validates :street_address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
end
