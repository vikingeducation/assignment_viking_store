class User < ApplicationRecord
  has_one :cart
  has_many :credit_cards
  has_many :user_addresses
  has_many :addresses, through: :user_addresses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def shipping_address
    addresses.where(id: default_address_ids, addr_type: :shipping).first
  end

  def billing_address
    addresses.where(id: default_address_ids, addr_type: :billing).first
  end

  private

  def default_address_ids
    user_addresses.where(default_address: true).pluck(:address_id)
  end
end
