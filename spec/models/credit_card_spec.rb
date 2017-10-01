require 'rails_helper'

RSpec.describe CreditCard, type: :model do

  it 'is valid with user, number, and expiration date' do
    card = build :credit_card
    expect(card).to be_valid
  end

  it 'is valid without a cvs' do
    card = build :credit_card, cvv: nil
    expect(card).to be_valid
  end

  it 'is invalid without a user' do
    card = build :credit_card, user: nil
    card.valid?
    expect(card.errors[:user]).to include 'must exist'
  end

  it 'is invalid without a number' do
    card = build :credit_card, number: nil
    card.valid?
    expect(card.errors[:number]).to include "can't be blank"
  end

  it 'is invalid without an expiration' do
    card = build :credit_card, expiration: nil
    card.valid?
    expect(card.errors[:expiration]).to include "can't be blank"
  end

end
