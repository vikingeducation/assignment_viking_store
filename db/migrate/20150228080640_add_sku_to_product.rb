class AddSkuToProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.integer :sku
    end
  end
end
