class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|


    	t.integer :order_id
    	t.integer :product_id


      t.timestamps
    end
  end
end
