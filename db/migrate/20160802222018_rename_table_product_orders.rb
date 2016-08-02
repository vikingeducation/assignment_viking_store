class RenameTableProductOrders < ActiveRecord::Migration
  def change
    drop_table :product_order

    create_table :product_orders do |t|
    t.references :product
    t.references :order
    end
  end

end
