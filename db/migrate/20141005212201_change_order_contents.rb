class ChangeOrderContents < ActiveRecord::Migration
  def change
   change_table :order_contents do |t|
    t.integer :current_price

  end
  end
end
