class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.integer :user_id
      t.integer :billing_id
      t.integer :shipping_id
      t.string :phone
      t.string :credit_card

      t.timestamps
    end
  end
end
