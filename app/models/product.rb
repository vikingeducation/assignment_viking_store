class Product < ApplicationRecord
  belongs_to :category, :class_name => 'ProductCategory', :foreign_key => 'product_category_id'
end
