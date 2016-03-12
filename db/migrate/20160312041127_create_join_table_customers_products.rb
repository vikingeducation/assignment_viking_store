class CreateJoinTableCustomersProducts < ActiveRecord::Migration
  def change
    create_join_table :customers, :products do |t|
      t.index :customer_id
      t.index :product_id
      t.integer :qty
    end
  end
end