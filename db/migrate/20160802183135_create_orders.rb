class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_id
      t.integer :billing_location_id
      t.boolean :open_order, default: :true

      t.timestamps null: false
    end
  end
end
