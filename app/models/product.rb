class Product < ApplicationRecord
  belongs_to :category

  has_many :order_contents
  has_many :orders, through: :order_contents

  validates :price, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :sku,
            presence: true,
            length: { maximum: 20 },
            numericality: { is_intger: true }
end
