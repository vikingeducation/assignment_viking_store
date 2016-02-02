class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :cart_id
      t.string :phone_number, null: false
      t.integer :credit_card_id

      t.timestamps null: false
    end
    add_foreign_key :orders, :users, index: true
    add_foreign_key :orders, :carts, index: true
    add_foreign_key :orders, :credit_cards, index: true
  end
end
