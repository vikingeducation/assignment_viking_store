class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :order_id
      t.integer :billing_address_id
      t.integer :shipping_address_id

      t.timestamps null: false
    end
    add_foreign_key :shipments, :addresses, column: :billing_address_id
    add_foreign_key :shipments, :addresses, column: :shipping_address_id
  end
end
