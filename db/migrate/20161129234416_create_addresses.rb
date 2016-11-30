class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.boolean :default
      t.integer :user_id

      t.timestamps
    end
  end
end
