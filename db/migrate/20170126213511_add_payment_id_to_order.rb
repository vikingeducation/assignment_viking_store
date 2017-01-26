class AddPaymentIdToOrder < ActiveRecord::Migration[5.0]
  def change
  		add_column :orders, :payment_id, :integer
  		add_foreign_key :orders, :payments
  end
end
