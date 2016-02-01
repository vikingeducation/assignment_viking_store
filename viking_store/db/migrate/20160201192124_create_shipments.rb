class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :shipping_address_id

      t.timestamps null: false
    end
  end
end
