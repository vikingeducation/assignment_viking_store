class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :item
      t.integer :quantity
      t.decimal :item_total_cost
      t.decimal :grand_total
      t.string :customer

      t.timestamps null: false
    end
  end
end
