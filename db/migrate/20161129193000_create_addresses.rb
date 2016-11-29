class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :state_id
      t.integer :country_id
      t.string  :city
      t.string  :street
      
      t.timestamps
    end
  end
end
