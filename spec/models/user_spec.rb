require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with email, first_name, and last_name' do
    user = build :user
    expect(user).to be_valid
  end

  it 'is invalid without first_name' do
    user = build :user, first_name: nil
    user.valid?
    expect(user.errors[:first_name]).to include "can't be blank"
  end

  it 'is invalid without last_name' do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include "can't be blank"
  end

  it 'is invalid without email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include "can't be blank"
  end

  it 'is invalid with duplicate email' do
    email = 'tester@example.com'
    create :user, email: email

    new_user = build :user, email: email
    new_user.valid?
    expect(new_user.errors[:email]).to include 'has already been taken'
  end

  it 'can have a cart' do
    user = build :user
    user.build_cart
    expect(user.cart).to be_valid
  end

  it 'can have a credit card' do
    user = build :user_with_card
    expect(user.credit_cards.first).to be_valid
  end

  describe 'addresses' do
    let(:user) { build :user }

    it 'can have a shipping address' do
      user = build :user_with_shipping_address
      expect(user.addresses.first.shipping?).to be true
    end

    it 'has a default shipping address' do
      user = create :user_with_default_shipping_address
      expected_address = user.addresses.first
      expect(user.shipping_address).to eq expected_address
    end
  end
end
