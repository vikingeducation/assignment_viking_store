class AddShippingAddressesToOrderAddresses < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_addresses, :shipping_addresses, foreign_key: true
  end
end
