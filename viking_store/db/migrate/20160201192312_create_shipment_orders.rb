class CreateShipmentOrders < ActiveRecord::Migration
  def change
    create_table :shipment_orders do |t|
      t.integer :shipment_id
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
