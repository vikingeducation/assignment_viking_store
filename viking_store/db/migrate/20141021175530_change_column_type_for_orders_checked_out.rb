class ChangeColumnTypeForOrdersCheckedOut < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.remove :checked_out
  		t.boolean :checked_out, :default => false
  	end
  end
end
