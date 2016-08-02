class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :to_location
      t.integer :from_location
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
