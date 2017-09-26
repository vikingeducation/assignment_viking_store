class AddAddrTypeToAddresses < ActiveRecord::Migration[5.1]
  def up
    add_column :addresses, :addr_type, :integer, null: false, default: 0
    add_index :addresses, :addr_type
  end

  def down
    remove_column :addresses, :addr_type
  end
end
# def up
#   change_column_default :addresses, :addr_type, from: nil, to: 0
# end
#
# def down
#   change_column_default :addresses, :addr_type, from: 0, to: nil
# end