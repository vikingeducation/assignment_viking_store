class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :cart, foreign_key: true
      t.string :phone, null: false
      t.string :cc, null: false
      t.integer :shipping_address_id, null: false
      t.integer :billing_address_id, null: false

      t.timestamps
    end
  end
end
