class CreateOrderContents < ActiveRecord::Migration
  def change
    create_table :order_contents do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer :product_amt

      t.timestamps null: false
    end
  end
end
