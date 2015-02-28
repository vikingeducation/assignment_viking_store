class CreateShoppingCartProducts < ActiveRecord::Migration
  def change
    create_table :shopping_cart_products do |t|
      t.integer :shopping_cart_id
      t.integer :product_id
      t.integer :product_qty

      t.timestamps null: false
    end
  end
end
