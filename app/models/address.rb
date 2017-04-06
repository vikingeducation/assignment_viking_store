class Address < ApplicationRecord

  

  validates :address_type, inclusion: { in: %w(billing shipping default_billing default_shipping shipping_and_billing)}


  # , message: "%{value} is not a valid address type" }

end
