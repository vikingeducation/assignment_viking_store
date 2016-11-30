class FixNullInSchema < ActiveRecord::Migration[5.0]
  def change
    change_column_null :categories, :name, false

    change_column_null :line_items, :quantity, false
    change_column_null :line_items, :sale_price, false

    change_column_null :orders, :date, false
    change_column_null :orders, :open, false

    change_column_null :products, :title, false
    change_column_null :products, :description, false
    change_column_null :products, :price, false
    change_column_null :products, :sku, false
  end
end
