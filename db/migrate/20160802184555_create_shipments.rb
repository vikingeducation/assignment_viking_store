class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :address

      t.timestamps null: false
    end
  end
end
