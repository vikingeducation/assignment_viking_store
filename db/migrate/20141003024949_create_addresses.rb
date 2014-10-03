class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id, :null => false
      t.string :street_address, :null => false
      t.string :city, :null => false
      t.string :state
      t.integer :zip
      t.string :country, :default => 'United States'
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
