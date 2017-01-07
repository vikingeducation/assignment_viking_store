class ChangeForeignKeyColumnNames < ActiveRecord::Migration[5.0]
  def change
    change_table :orders do |t|
      t.rename :user, :user_id
      t.rename :billing, :billing_id
      t.rename :shipping, :shipping_id
    end
    change_table :addresses do |t|
      t.rename :user, :user_id
    end
    change_table :credit_cards do |t|
      t.rename :user, :user_id
      t.rename :address, :address_id
    end
    change_table :product_orders do |t|
      t.rename :product, :product_id
      t.rename :order, :order_id
    end
    change_table :products do |t|
      t.rename :category, :category_id
    end
    change_table :users do |t|
      t.rename :default_billing, :default_billing_id
      t.rename :default_shipping, :default_shipping_id
    end
  end
end
