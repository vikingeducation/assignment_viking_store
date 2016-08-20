class ChangeColumnAtProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :SKU_number, :string
    change_column :products, :price, :string
  end
end
