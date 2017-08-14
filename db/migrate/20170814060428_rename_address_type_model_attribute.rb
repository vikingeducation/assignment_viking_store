class RenameAddressTypeModelAttribute < ActiveRecord::Migration[5.1]
  def change
    rename_column :address_types, :type, :address_type
  end
end
