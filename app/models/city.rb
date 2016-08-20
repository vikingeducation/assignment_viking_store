class City < ApplicationRecord
  has_many :addresses

  validates :city, presence: true, length: { maximum: 140 }
end
