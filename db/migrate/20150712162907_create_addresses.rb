class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :street_address_1, :null => false
      t.string :street_address_2
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false
      t.boolean :default_shipping, :null => false, :default => false
      t.boolean :default_billing, :null => false, :default => false
      t.integer :user_id, :null => false

      t.timestamps null: false
    end
  end
end
