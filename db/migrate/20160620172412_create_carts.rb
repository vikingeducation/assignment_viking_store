class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
