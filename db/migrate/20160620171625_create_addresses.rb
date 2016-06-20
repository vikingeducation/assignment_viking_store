class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :street_address, null: false
      t.integer :city_id, null: false
      t.integer :state_id, null: false
      t.integer :zip_code, null: false

      t.timestamps null: false
    end
  end
end
