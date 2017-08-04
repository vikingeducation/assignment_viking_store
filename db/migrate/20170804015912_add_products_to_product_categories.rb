class AddProductsToProductCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_categories, :products, foreign_key: true
  end
end
