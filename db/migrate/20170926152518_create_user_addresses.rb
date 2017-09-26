class CreateUserAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_addresses do |t|
      t.integer :user_id
      t.integer :address_id
      t.boolean :default_address, default: false

      t.timestamps
    end

    add_index :user_addresses, [:user_id, :address_id]
  end
end
