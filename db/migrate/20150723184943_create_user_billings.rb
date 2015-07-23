class CreateUserBillings < ActiveRecord::Migration
  def change
    create_table :user_billings do |t|

      t.integer :buyer_id, null:false
      t.integer :billing_id, null:false

      t.timestamps null: false
    end
  end
end
