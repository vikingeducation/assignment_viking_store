class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|

      t.integer :user_id, null:false
      t.integer :shipment_address_id, null:false
      t.datetime :pack_date
      t.datetime :ship_date
      t.datetime :arrival_date

      t.timestamps null: false
    end
  end
end
