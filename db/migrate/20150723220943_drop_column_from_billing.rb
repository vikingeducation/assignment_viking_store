class DropColumnFromBilling < ActiveRecord::Migration
  def change
    remove_column :billings, :billing_id
  end
end
