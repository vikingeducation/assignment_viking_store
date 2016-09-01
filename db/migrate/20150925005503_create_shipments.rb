class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.datetime :departure_time
      t.datetime :arrival_time
      t.integer :destination_id

      t.index :destination_id

      t.timestamps null: false
    end
  end
end
