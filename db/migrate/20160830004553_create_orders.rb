class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date, null: false
      t.integer :user_id, null: false
      t.integer :billing_id, null: false
      t.integer :shipping_id, null: false
      t.string :phone, null: false
      t.string :credit_card, null: false

      t.timestamps
    end
  end
end
