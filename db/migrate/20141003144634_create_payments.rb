class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id, :null => :false
      t.integer :cc_last_4, :null => :false
      t.integer :cvv, :null => :false
      t.integer :exp, :null => :false
      t.timestamps
    end
  end
end
