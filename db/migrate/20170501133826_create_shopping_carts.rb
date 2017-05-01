class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :user_id, :null => false
      t.boolean :checked_out, :null => false
      t.integer :shipping_address
      t.integer :billing_address

      t.timestamps
    end
  end
end
