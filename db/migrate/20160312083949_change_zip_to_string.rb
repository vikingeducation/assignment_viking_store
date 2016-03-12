class ChangeZipToString < ActiveRecord::Migration
  def change
    change_column :billing_addresses, :zip, :string
    change_column :shipping_addresses, :zip, :string
  end
end
