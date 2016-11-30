class AddOrderLineItemRelationships < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :users, :foreign_key => true
    add_reference :line_items, :products, :foreign_key => true
    add_reference :line_items, :orders, :foreign_key => true
  end
end
