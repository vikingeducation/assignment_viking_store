class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|

      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.float :price

      t.timestamps null: false
    end
  end
end
