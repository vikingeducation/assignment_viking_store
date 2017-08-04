class AddProductsToSkus < ActiveRecord::Migration[5.0]
  def change
    add_reference :skus, :products, foreign_key: true
  end
end
