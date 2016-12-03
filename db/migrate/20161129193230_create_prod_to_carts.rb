class CreateProdToCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :prod_to_carts do |t|
      t.integer :product_id
      t.integer :shopping_cart_id
      t.integer :amount
      
      t.timestamps
    end
  end
end
