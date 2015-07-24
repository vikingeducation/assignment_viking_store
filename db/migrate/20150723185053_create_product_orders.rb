class CreateProductOrders < ActiveRecord::Migration
  def change
    create_table :product_orders do |t|

      t.integer :order_id, null:false
      t.integer :product_id, null:false
      t.integer :product_quantity, null:false

      t.timestamps null: false
    end
  end
end
