class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :bill_address_id
      t.integer :ship_address_id
      t.datetime :purchase_date
      t.integer :payment_id

      t.timestamps null: false
    end
  end
end
