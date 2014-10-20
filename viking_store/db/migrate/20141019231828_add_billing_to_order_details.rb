class AddBillingToOrderDetails < ActiveRecord::Migration
  def change
  	add_column :order_details, :billing_address_id, :string
  	add_column :order_details, :shipping_address_id, :string
  end
end
