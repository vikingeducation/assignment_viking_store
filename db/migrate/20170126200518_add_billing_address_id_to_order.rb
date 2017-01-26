class AddBillingAddressIdToOrder < ActiveRecord::Migration[5.0]
  def change
  		add_column :orders, :billing_address_id, :integer
  end
end
