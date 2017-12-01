class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.integer :qty
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end


order = Order.first
products = Product.all

item = OrderItem.create!(order_id: order.id, qty: rand(1..5), product_id: products.sample.id)
