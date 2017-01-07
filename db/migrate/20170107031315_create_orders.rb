class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user
      t.integer :billing
      t.integer :shipping
      t.datetime :checkout

      t.timestamps
    end
  end
end
