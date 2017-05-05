class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :checkout_date
      t.integer :user_id, :null => false
      t.integer :shipping_id
      t.integer :billing_id
      t.integer :credit_card_id

      t.timestamps
    end
  end
end
