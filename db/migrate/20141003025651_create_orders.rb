class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, :null => false
      t.integer :shipping_address
      t.integer :billing_address
      t.boolean :placed, :default => false
      t.datetime :when_placed

      t.timestamps
    end
  end
end
