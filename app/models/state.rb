class State < ApplicationRecord
  has_many :cities
  has_many :zip_codes
  belongs_to :country
end
