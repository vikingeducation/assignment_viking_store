class Address < ApplicationRecord
  belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :address_type
  belongs_to :user
end
