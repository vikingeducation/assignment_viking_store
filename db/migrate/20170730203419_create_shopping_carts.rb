class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.string :user_id
      t.string :product_id
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end
end
