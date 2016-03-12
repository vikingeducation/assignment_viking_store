class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :shipping_address_id, null: false
      t.integer :billing_address_id, null: false
      t.string :phone, null: false
      t.string :credit_card, null: false

      t.timestamps null: false
    end
  end
end
