class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :zip_code
  belongs_to :country
  belongs_to :profile
  belongs_to :shipment
end
