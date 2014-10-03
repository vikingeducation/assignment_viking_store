class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null:false
      t.integer :billing_address_id, null:false
      t.integer :shipping_address_id, null:false
      
      t.boolean :is_placed, default: true, null: false

      t.timestamps
    end
  end
end
