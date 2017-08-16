class AssociateAddressesWithOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :address, foreign_key: true
    rename_column :orders, :address_id, :billing_address_id

    add_reference :orders, :address, foreign_key: true
    rename_column :orders, :address_id, :shipping_address_id
  end
end
