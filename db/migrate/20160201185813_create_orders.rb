class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true, null: false

      t.integer :billing_address_id, index: true
      t.integer :shipping_address_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :order, column: :billing_address_id
    add_foreign_key :addresses, :order, column: :shipping_address_id
  end
end
