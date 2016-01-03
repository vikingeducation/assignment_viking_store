class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.datetime :checkout_date
      t.integer :shipping_id, index: true
      t.integer :billing_id, index: true
      t.references :credit_card, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_foreign_key :orders, :addresses, column: :shipping_id
    add_foreign_key :orders, :addresses, column: :billing_id
  end
end
