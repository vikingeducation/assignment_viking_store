class ChangeProductSku < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :sku
    end
  end
end