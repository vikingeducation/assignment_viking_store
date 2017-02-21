class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :billing_address_id, index:true, null:false
      t.integer :shipping_address_id, index:true, null:false
      t.datetime :checkout

      t.timestamps
    end
  end
end
