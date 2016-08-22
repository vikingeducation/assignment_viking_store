class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :credit_card_id
      t.integer :shipping_id
      t.integer :user_id,         null: false
      t.integer :billing_id
      t.datetime :checkout_date

      t.timestamps
    end
  end
end
