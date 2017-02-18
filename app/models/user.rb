class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
end
