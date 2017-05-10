class ChangeDefaultColumnsInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :shipping_address_id, :shipping_default_id

    rename_column :users, :billing_address_id, :billing_default_id
  end
end
