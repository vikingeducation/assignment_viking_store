class AddressType < ApplicationRecord
  has_many :addresses
  has_many :users, through: :addresses
end
