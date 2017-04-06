class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :product_id, null: false
      t.integer :quantity, null: false
      t.integer :shipping_addr_id
      t.integer :billing_addr_id

      t.timestamps
    end
  end
end
