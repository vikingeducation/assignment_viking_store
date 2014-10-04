class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :user_email, :null => :false
      t.string :first_name, :null => :false
      t.string :last_name, :null => :false
      t.integer :phone
      t.integer :default_billing
      t.integer :default_shipping
      t.timestamps
    end
  end
end