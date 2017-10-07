class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.integer :city_id
      t.integer :state_id
      t.integer :zip, mull: false, limit: 5

      t.timestamps
    end
  end
end
