class CreateProductOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :product_orders do |t|
      t.integer :product
      t.integer :quantity
      t.integer :order
      t.timestamps
    end
  end
end
