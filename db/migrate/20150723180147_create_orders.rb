class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.datetime :checkout_date
      t.references :users

      t.timestamps null: false
    end
  end
end
