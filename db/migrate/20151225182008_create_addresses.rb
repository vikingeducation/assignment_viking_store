class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :street_address, null: false
      t.string :secondary_address
      t.references :city, index: true, foreign_key: true, null: false
      t.references :state, index: true, foreign_key: true, null: false
      t.string :zip_code, null: false

      t.timestamps null: false
    end
  end
end
