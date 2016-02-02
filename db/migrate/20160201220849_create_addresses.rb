class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :street_address, null: false
      t.integer :city_id
      t.integer :state_id
      t.integer :country_id
      t.string :type, null: false
      t.integer :zip_code, null: false
      t.boolean :default, null: false

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users, index: true
    add_foreign_key :addresses, :cities, index: true
    add_foreign_key :addresses, :states, index: true
    add_foreign_key :addresses, :countries, index: true
  end
end
