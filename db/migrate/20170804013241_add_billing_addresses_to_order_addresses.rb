class AddBillingAddressesToOrderAddresses < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_addresses, :billing_addresses, foreign_key: true
  end
end
