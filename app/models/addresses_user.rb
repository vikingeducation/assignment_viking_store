class AddressesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
end
