class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id, null: false
      t.string :first_line, null: false
      t.integer :city_id, null: false
      t.integer :state_id, null: false
      t.integer :zip, null: false
      t.boolean :default, null: false

      t.timestamps null: false
    end
  end
end