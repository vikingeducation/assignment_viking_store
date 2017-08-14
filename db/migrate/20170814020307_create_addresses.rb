class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.references :country, foreign_key: true
      t.string :zipcode
      t.string :phone_number
      t.references :address_type, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
