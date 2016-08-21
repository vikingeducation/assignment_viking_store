class ChangeSkuType < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :sku, :string
  end
end
