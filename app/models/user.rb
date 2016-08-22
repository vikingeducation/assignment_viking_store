class User < ApplicationRecord
  # User has many addresses
  # But only one default billing address
  # As the same for the shipping address
  has_many :addresses
  has_many :credit_cards, dependent: :destroy
  has_many :orders

  has_many :products, through: :order_contents
  #
  has_one :shipping_address,
             :foreign_key => "shipping_id",
             :class_name => "Address"

  has_one :billing_address,
             :foreign_key => "billing_id",
             :class_name => "Address"
  #
  validates :first_name, :last_name, length: { maximum: 250 }, presence: true
  accepts_nested_attributes_for :addresses,
                                :allow_destroy => true,
                                :reject_if => :all_blank
end
