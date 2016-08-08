class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :bill_id
      t.integer :ship_id
      t.integer :card_id
      t.integer :subtotal
      t.integer :shipping
      t.integer :tax

      t.timestamps
    end
  end
end
