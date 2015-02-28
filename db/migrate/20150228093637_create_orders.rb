class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :shopping_cart_id
      t.integer :shipping_address_id
      t.integer :billing__address_id
      t.integer :status


      t.timestamps null: false
    end
  end
end
