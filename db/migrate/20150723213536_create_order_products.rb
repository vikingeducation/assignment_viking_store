class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order
      t.references :product
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
