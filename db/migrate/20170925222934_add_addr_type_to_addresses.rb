class AddAddrTypeToAddresses < ActiveRecord::Migration[5.1]
  def up
    add_column :addresses, :addr_type, :integer, null: false, default: 0
    add_index :addresses, :addr_type
  end

  def down
    remove_column :addresses, :addr_type
  end
end