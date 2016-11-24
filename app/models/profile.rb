class Profile < ApplicationRecord

	has_one :credit_card
	has_one :default_billing_address
	has_one :default_shipping_address
	has_many :addresses
	belongs_to :user, optional: true

end
