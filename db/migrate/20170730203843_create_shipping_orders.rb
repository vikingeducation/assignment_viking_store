class CreateShippingOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_orders do |t|
      t.integer :user_id
      t.integer :default_shipping_addr_id
      t.integer :default_billing_addr_id
      t.integer :total_cost

      t.timestamps
    end
  end
end
