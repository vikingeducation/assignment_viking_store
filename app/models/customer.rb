class Customer < ApplicationRecord
  validates :credit_card, :phone_number, { presence: true }
end