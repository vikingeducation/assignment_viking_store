class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|

      t.integer :price, null: false
      t.integer :buyer_id, null: false

      t.timestamps null: false
    end
  end
end
