class Category < ActiveRecord::Base


  has_many :products, dependent: :destroy

  validates :name,
            presence: true,
            uniqueness: true,
            allow_blank: false,
            allow_nil: false,
            length: {
              in: 4..16
            }
end
