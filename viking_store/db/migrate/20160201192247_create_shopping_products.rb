class CreateShoppingProducts < ActiveRecord::Migration
  def change
    create_table :shopping_products do |t|
      t.integer :shopping_cart_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
