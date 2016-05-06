class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :check_out
      t.integer :billing_id
      t.timestamps null: false
    end

    add_foreign_key :orders, :users, :index
    add_foreign_key :orders, :billings, :index
  end
end
