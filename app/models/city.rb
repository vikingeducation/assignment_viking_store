class City < ApplicationRecord
  has_many :addresses

  validates :name,
            presence: true,
            length: { maximum: 140 },
            uniqueness: true,
            allow_blank: false,
            allow_nil: false
end
