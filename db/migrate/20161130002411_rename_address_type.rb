class RenameAddressType < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :type
    add_column :addresses, :address_type, :string
  end
end
