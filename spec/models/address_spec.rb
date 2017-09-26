require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address_attrs) do
    {
      street_1: '123 Main St', street_2: 'Apt 200', city: 'Springfield',
      state: 'IL', post_code: '10101', plus_4: '1234'
    }
  end

  describe 'typical/common address attributes' do

    it 'is valid with a street address, city, state, and post code' do
      address = Address.new address_attrs
      expect(address).to be_valid
    end

    it 'is invalid without a street address' do
      address = Address.new address_attrs.merge street_1: nil
      address.valid?
      expect(address.errors[:street_1]).to include "can't be blank"
    end

    it 'is invalid without a city' do
      address = Address.new address_attrs.merge city: nil
      address.valid?
      expect(address.errors[:city]).to include "can't be blank"
    end

    it 'is invalid without a state' do
      address = Address.new address_attrs.merge state: nil
      address.valid?
      expect(address.errors[:state]).to include "can't be blank"
    end

    it 'is invalid without a zip code' do
      address = Address.new address_attrs.merge post_code: nil
      address.valid?
      expect(address.errors[:post_code]).to include "can't be blank"
    end
  end

  describe 'address type' do
    it 'can be type shipping' do
      ship_addr = Address.new address_attrs.merge addr_type: 'shipping'
      expect(ship_addr.shipping?).to be true
    end

    it 'can be type billing' do
      bill_addr = Address.new address_attrs.merge addr_type: 'billing'
      expect(bill_addr.billing?).to be true
    end

    it 'defaults to shipping' do
      address = Address.create address_attrs
      expect(address.shipping?).to be true
    end
  end
end
