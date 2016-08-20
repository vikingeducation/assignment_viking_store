class User < ApplicationRecord
  # User has many addresses
  # But only one default billing address
  # As the same for the shipping address
  has_many :addresses
  has_many :credit_cards

  belongs_to :billing_address,
             class_name: "Address",
             :foreign_key => :billing_id

  belongs_to :shipping_address,
             class_name: "Address",
             :foreign_key => :shipping_id
end
