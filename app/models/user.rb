class User < ActiveRecord::Base
  has_many :credit_cards
end
