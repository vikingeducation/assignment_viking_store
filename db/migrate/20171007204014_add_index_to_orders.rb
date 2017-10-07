class AddIndexToOrders < ActiveRecord::Migration[5.0]
  def change
    add_index :orders, [:shipping_address_id, :billing_address_id]
  end
end
