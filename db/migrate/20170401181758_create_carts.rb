class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
