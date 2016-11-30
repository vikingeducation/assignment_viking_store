class CreateJoinTableOrdersProducts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :orders, :products do |t|
      t.index   [:order_id, :product_id]
      t.index   [:product_id, :order_id]
      t.integer :quantity
      t.float   :cost
    end
  end
end
