class AssociateAddressesWithUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :address, foreign_key: true
    rename_column :users, :address_id, :default_billing_address_id

    add_reference :users, :address, foreign_key: true
    rename_column :users, :address_id, :default_shipping_address_id
  end
end
