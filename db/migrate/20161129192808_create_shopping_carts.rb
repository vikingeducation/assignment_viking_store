class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.integer :user_id
      t.boolean :checked_out
      
      t.timestamps
    end
  end
end
