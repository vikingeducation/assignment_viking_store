class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :building_number
      t.string :street_name
      t.string :state_id
      t.string :city_id
      t.string :zip
      t.string :address_type
      t.string :default_flag

      t.timestamps
    end
  end
end
