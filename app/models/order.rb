class Order < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :credit_card

  has_many :order_contents
  has_many :products, through: :order_contents

  belongs_to :shipping_address,
             class_name: "Address",
             :foreign_key => "shipping_id"

  belongs_to :billing_address,
             class_name: "Address",
             :foreign_key => "billing_id"

  validates :user_id, presence: true
end
