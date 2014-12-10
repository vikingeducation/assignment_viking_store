class FixOrdersTables < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.remove :product_id, :quantity
  		t.integer :billing_address_id
  		t.integer :shipping_address_id
  		t.datetime :checked_out
  		t.datetime :checkout_time
  	end
  end
end
