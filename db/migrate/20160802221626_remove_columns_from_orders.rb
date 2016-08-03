class RemoveColumnsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_reference :orders, :customer
    remove_reference :orders, :cart

    add_column :orders, :scheduled_delivery, :datetime

  end
end
