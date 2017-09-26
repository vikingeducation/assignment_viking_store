class Address < ApplicationRecord
  has_many :user_addresses
  has_many :users, through: :user_addresses

  enum addr_type: { shipping: 0, billing: 1 }

  validates :street_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :post_code, presence: true

end
