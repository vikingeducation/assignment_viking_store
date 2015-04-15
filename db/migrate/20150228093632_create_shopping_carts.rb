class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :user_id
      t.float :total_cost

      t.timestamps null: false
    end
  end
end
