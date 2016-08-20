class CreateCartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_products do |t|
      t.integer :quantity

      t.timestamps
    end

    add_reference :cart_products, :shopping_cart, index: true
    add_foreign_key :cart_products, :shopping_carts

    add_reference :cart_products, :product, index: true
    add_foreign_key :cart_products, :products
  end
end
