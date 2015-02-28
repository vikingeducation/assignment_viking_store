class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.integer :payment_method_id
      t.boolean :shopping_cart

      t.timestamps null: false
    end
  end
end
