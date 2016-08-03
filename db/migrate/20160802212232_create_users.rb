class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_num
      t.integer :ship_addr_id
      t.integer :bill_addr_id

      t.timestamps
    end
  end
end
