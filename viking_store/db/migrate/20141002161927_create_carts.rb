class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	# method for creating user_id ref
    	# method for creating product_id ref

      t.timestamps
    end
  end
end
