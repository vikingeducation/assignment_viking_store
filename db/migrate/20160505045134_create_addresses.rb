class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :street_nb
      t.string :street
      t.integer :city_id
      t.integer :state_id
      t.integer :zip_code
      t.integer :country_id
      t.boolean :default

      t.timestamps null: false
    end

    add_foreign_key :addresses, :users, index:true
    add_foreign_key :addresses, :cities, index: true
    add_foreign_key :addresses, :states, index: true
    add_foreign_key :addresses, :countries, index: true
  end
end