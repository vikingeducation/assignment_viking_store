class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false
      t.string :street_address, null: false
      t.string :secondary_address
      t.string :city, null: false
      t.integer :zip, null: false
      t.string :state
      t.string :country, default: "US"
      t.timestamps
    end
  end
end
