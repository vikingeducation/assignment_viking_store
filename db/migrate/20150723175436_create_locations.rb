class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode

      t.timestamps null: false
    end
  end
end
