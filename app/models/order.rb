class Order < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :credit_card

  has_many :order_contents
  has_many :products, through: :order_contents

  belongs_to :shipping_address,
             :foreign_key => "shipping_id",
             :class_name => "Address"

  belongs_to :billing_address,
             :foreign_key => "billing_id",
             :class_name => "Address"

  validates :user_id, presence: true
end
