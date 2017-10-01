class State < ApplicationRecord
  has_many :addresses
  has_many :cities
end
