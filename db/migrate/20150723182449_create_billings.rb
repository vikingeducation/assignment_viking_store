class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string :creditcard , null: false
      t.string :first_name , null: false
    
      t.string :last_name, null: false
      t.date :exp, null: false
      t.string :CVC, null: false
      t.string :type, null: false
      t.string :billing_id, null: false
      
      t.timestamps null: false
    end
  end
end
