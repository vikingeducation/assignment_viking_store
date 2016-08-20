class User < ApplicationRecord
  has_many :user_details
  has_many :shopping_carts
end
