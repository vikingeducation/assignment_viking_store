class Address < ActiveRecord::Base
  has_many :order

  has_many :addresses_users
  has_many :users, through: :addresses_users
end
