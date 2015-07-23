class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.integer :billing_id
      t.integer :buyer_id
      t.integer :shipping_address_id

      t.timestamps null: false
    end
  end
end
