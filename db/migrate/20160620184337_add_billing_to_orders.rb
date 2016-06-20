class AddBillingToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :billing_id, :integer
  end
end
