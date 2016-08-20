class UserDetail < ApplicationRecord
  belongs_to :user
  has_many   :credit_cards
  has_many   :addresses
end
