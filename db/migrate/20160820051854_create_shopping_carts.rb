class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.boolean :checked

      t.timestamps
    end

    add_reference :shopping_carts, :user, index: true
    add_foreign_key :shopping_carts, :users

    add_reference :shopping_carts, :order, index: true
    add_foreign_key :shopping_carts, :orders

  end
end
