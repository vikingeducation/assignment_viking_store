require 'rails_helper'

RSpec.describe CreditCard, type: :model do

  it 'is valid with user, number, and expiration date' do
    card = CreditCard.new number: '123', expiration: '123'
    card.build_user first_name: 'Joe', last_name: 'Smith',
                    email: 'tester@example.com'
    expect(card).to be_valid
  end

  it 'is valid without a cvs' do
    card = CreditCard.new cvs: nil
    card.valid?
    expect(card.errors[:cvs]).not_to include "can't be blank"
  end

  it 'is invalid without a user' do
    card = CreditCard.new number: '123', expiration: '123'
    card.valid?
    expect(card.errors[:user]).to include 'must exist'
  end

  it 'is invalid without a number' do
    card = CreditCard.new number: nil
    card.valid?
    expect(card.errors[:number]).to include "can't be blank"
  end

  it 'is invalid without an expiration' do
    card = CreditCard.new expiration: nil
    card.valid?
    expect(card.errors[:expiration]).to include "can't be blank"
  end

end
