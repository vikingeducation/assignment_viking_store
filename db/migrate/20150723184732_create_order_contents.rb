class CreateOrderContents < ActiveRecord::Migration
  def change
    create_table :order_contents do |t|
      t.reference :order
      t.reference :content
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
