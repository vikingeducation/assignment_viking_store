class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :state_id
      t.string :zip_code
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
