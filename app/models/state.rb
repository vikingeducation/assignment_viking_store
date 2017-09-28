class State < ApplicationRecord
  has_many :addresses
  has_many :states
end
