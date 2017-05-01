class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.integer :user_id, :null => false
      t.integer :address_id, :null => false

      t.timestamps
    end
  end
end
