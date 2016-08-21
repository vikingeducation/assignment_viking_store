class City < ApplicationRecord
  has_many :addresses

  validates :name, presence: true, length: { maximum: 140 }
end
