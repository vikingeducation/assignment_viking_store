class AddColumnToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :active, :boolean, default: true 
  end
end
