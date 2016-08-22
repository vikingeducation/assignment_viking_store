class Address < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :state

  has_many :orders_billed_here,
           :foreign_key => "billing_id",
           :class_name => "Order"

  has_many :orders_shipped_here,
           :foreign_key => "shipping_id",
           :class_name => "Order"

  # has_one :default_billing_user,
  #         :foreign_key => "billing_id",
  #         :class_name => "User"
  #
  # has_one :default_shipping_user,
  #         :foreign_key => "shipping_id",
  #         :class_name => "User"




  validates :street_address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
end
