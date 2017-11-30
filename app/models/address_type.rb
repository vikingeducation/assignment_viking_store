class AddressType < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :users, through: :addresses
end
