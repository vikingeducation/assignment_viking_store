class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :card_number, uniqueness: true
end
