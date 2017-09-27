require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'typical/common address attributes' do

    it 'is valid with a street address, city, state, and post code' do
      address = build :address
      expect(address).to be_valid
    end

    it 'is invalid without a street address' do
      address = build :address, street_1: nil
      address.valid?
      expect(address.errors[:street_1]).to include "can't be blank"
    end

    it 'is invalid without a city' do
      address = build :address, city: nil
      address.valid?
      expect(address.errors[:city]).to include "can't be blank"
    end

    it 'is invalid without a state' do
      address = build :address, state: nil
      address.valid?
      expect(address.errors[:state]).to include "can't be blank"
    end

    it 'is invalid without a zip code' do
      address = build :address, post_code: nil
      address.valid?
      expect(address.errors[:post_code]).to include "can't be blank"
    end
  end

  describe 'address type' do
    it 'can be type shipping' do
      ship_addr = build :address, addr_type: 'shipping'
      expect(ship_addr.shipping?).to be true
    end

    it 'can be type billing' do
      bill_addr = build :address, addr_type: 'billing'
      expect(bill_addr.billing?).to be true
    end

    it 'defaults to shipping' do
      address = build :address
      expect(address.shipping?).to be true
    end
  end
end
