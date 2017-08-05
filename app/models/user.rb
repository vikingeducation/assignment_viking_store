class User < ApplicationRecord
	has_many :addresses
	has_many :orders
	has_many :credit_cards

	has_many :products, through: :order_contents

	belongs_to :shipping_address,
				class_name: "Address",
				foreign_key: :shipping_id

	belong_to :billing_address,
			   class_name: "Address",
			   foreign_key: :billing_id
end
