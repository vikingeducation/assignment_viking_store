class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :customer_profile_id

      t.timestamps null: false
    end
  end
end
