class Address < ActiveRecord::Base
  has_many :shipments
  has_many :users
end
