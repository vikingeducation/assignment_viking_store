class CreditCard < ApplicationRecord
  belongs_to :user

  validates :number, presence: true
  validates :expiration, presence: true
end
