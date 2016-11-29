class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.integer :order_id
      t.datetime :shipped_on
      t.datetime :arrived_on
      t.integer :tracking_number
      t.integer :shipping_address_id

      t.timestamps
    end
  end
end
