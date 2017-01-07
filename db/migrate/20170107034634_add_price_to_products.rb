class AddPriceToProducts < ActiveRecord::Migration[5.0]
  def change
  end
  add_column :products, :price, :decimal, :precision => 8, :scale => 2 
end
