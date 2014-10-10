class Address < ActiveRecord::Base
	belongs_to :city
	belongs_to :state

	belongs_to :user

	has_one :default_billing_address,
					foreign_key: :billing_id
	has_one :default_shipping_address, 
end
