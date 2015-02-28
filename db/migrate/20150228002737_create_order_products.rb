class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
