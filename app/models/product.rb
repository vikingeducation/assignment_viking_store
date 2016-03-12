class Product < ActiveRecord::Base
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :customers
  belongs_to :group
end
