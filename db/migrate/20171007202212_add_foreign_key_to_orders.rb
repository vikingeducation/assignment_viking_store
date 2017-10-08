class AddForeignKeyToOrders < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :orders, :addresses, column: :shipping_address_id, primary_key: :id
    add_foreign_key :orders, :addresses, column: :billing_address_id, primary_key: :id
  end
end
