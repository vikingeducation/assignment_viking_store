class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :destination_id
      t.integer :shipment_status_id

      t.index :destination_id
      t.index :shipment_status_id

      t.timestamps null: false
    end
  end
end
