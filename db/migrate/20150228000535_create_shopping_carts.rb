class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.string :item
      t.integer :quantity
      t.decimal :item_total_cost
      t.decimal :grand_total
      t.boolean :checked_out
      t.string :customer

      t.timestamps null: false
    end
  end
end
