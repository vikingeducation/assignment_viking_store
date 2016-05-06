class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :shopping_carts, :orders, :index
    add_foreign_key :shopping_carts, :products, :index
  end
end
