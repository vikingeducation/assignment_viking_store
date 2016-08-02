class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :check_date
      t.boolean :check_out, default: true

      t.integer :user_id
      t.integer :shipping_id
      t.integer :billing_id

      t.timestamps
    end
  end
end
