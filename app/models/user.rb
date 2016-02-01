class User < ActiveRecord::Base
  has_many :addresses, through: :user_addresses
end
