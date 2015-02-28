class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :shopping_cart_id
      t.boolean :processed


      t.timestamps null: false
    end
  end
end
