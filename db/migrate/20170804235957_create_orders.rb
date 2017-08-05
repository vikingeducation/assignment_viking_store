class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.boolean :checked_out
      t.datetime :checkout_date
      t.integer :user_id
      t.integer :billing_id
      t.integer :shipping_id

      t.timestamps
    end
  end
end
