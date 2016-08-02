class AddColumnToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :quantity, :integer
    add_reference :carts, :order, foreign_key: true
  end
end
