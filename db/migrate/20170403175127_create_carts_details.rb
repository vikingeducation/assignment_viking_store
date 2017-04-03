class CreateCartsDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :carts_details do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity, null: false
    end
  end
end
