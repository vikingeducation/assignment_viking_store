class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_id, :null => :false
      t.integer :user_id, :null => :false
      t.integer :billing_address, :null => :false
      t.integer :shipping_address, :null => :false
      t.boolean :is_placed, :default => :false
      t.datetime :when_placed
      t.timestamps
    end
  end
end
