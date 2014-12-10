class FixOrderDetailsTable < ActiveRecord::Migration
  def change
  	change_table :order_details do |t|
			t.remove :billing_address_id, :shipping_address_id
		end
  end
end
