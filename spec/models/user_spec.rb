require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_attributes) do
    {
      first_name: 'Larry',
      last_name: 'Jones',
      email: 'tester@example.com'
    }
  end

  it 'is valid with email, first_name, and last_name' do
    user = User.new(user_attributes)
    expect(user).to be_valid
  end

  it 'is invalid without first_name' do
    user = User.new(first_name: nil)
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
    User.create user_attributes
    new_user = User.new(email: 'tester@example.com')
    new_user.valid?
    expect(new_user.errors[:email]).to include 'has already been taken'
  end

  it 'can have a cart' do
    user = User.create user_attributes
    user.create_cart
    expect(user.cart.id).not_to be_nil
  end

  it 'can have a credit card' do
    user = User.create user_attributes
    user.credit_cards.create number: '123', expiration: '123'
  end
end
