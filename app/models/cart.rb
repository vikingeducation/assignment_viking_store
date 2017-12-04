class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, dependent: :destroy
  has_many :items, foreign_key: 'cart_id', class_name: 'CartItem'
end
