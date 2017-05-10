class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :date_completed
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.integer :order_value
      t.integer :tax_rate

      t.timestamps
    end
  end
end
