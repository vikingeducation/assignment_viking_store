class User < ApplicationRecord
  has_many :addresses

  def shipping_addresses
    addresses_by_type(:shipping)
  end

  def billing_addresses
    addresses_by_type(:billing)
  end

  def default_shipping_address
    addresses_by_type(:default_shipping).first
  end

  def default_billing_address
    addresses_by_type(:default_billing).first
  end

  private

  def addresses_by_type(type)
    type.to_s.gsub!('_', '.+')
    addresses.where(address_type: Address::ADDRESS_TYPES.grep(/#{type}/))
  end
end
