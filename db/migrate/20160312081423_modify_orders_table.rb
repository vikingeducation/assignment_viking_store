class ModifyOrdersTable < ActiveRecord::Migration
  def change
    remove_column :orders, :shipping_address_id
    remove_column :orders, :billing_address_id

    add_column :orders, :s_a_first_line, :string
    add_column :orders, :s_a_city, :string
    add_column :orders, :s_a_state, :string
    add_column :orders, :s_a_zip, :string
    add_column :orders, :b_a_first_line, :string
    add_column :orders, :b_a_city, :string
    add_column :orders, :b_a_state, :string
    add_column :orders, :b_a_zip, :string
  end
end
