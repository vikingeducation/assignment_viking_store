class Product < ActiveRecord::Base
  belongs_to :category, :class_name => 'ProductCategory', :foreign_key => 'product_category_id'
end
