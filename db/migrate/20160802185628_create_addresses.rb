class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
