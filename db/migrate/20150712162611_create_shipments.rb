class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :tracking_number, :null => false, :unique => true, :index => true
      t.datetime :shipping_date, :null => false
      t.integer :shipping_address_id, :null => false
      t.integer :order_id, :null => false, :unique => true

      t.timestamps null: false
    end
  end
end
