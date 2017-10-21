class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.belongs_to :customer, index: true
      t.integer :customer_id

      t.timestamps
    end
  end
end
