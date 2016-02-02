class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_id
      t.datetime :order_date
      t.string :order_status

      t.timestamps null: false
    end
  end
end
