class Address < ApplicationRecord
  belongs_to :address_type
  belongs_to :user
  belongs_to :state
end
