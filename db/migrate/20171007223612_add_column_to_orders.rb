class AddColumnToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cc_expiration, :datetime, null: false
    add_column :orders, :type_of_card, :string, null: false
  end
end
