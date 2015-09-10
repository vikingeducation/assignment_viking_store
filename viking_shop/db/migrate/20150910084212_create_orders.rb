class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string :user_name, null: false
      t.integer :bill_add, null: false
      t.integer :ship_add, null: false
      t.integer :price, null: false

      t.timestamps null: false
    end
  end
end
