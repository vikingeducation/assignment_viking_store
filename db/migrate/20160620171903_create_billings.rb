class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :user_id
      t.integer :address_id
      t.integer :payment_id

      t.timestamps null: false
    end
  end
end
