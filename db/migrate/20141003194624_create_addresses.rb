class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.integer :zip, null: false
      t.integer :phone_number, null: false
      
      t.integer :city_id, null: false
      t.integer :state_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
