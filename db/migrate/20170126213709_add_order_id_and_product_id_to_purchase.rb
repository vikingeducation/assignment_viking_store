class AddOrderIdAndProductIdToPurchase < ActiveRecord::Migration[5.0]
  def change
  		add_column :purchases, :order_id, :integer
  		add_foreign_key :purchases, :orders

  		add_column :purchases, :product_id, :integer
  		add_foreign_key :purchases, :products
  end
end
