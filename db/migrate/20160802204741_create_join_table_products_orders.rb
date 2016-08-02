class CreateJoinTableProductsOrders < ActiveRecord::Migration
  def change
    create_join_table :products, :orders do |t|
      t.index :product_id
      t.index :order_id
      t.integer :product_amount
    end
  end
end
