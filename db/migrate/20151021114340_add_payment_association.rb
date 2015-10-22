class AddPaymentAssociation < ActiveRecord::Migration
  def change
    add_reference :payments, :order, index: true
    remove_column :orders, :payment_id
  end
end
