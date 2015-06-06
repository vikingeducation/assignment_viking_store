class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :email, :null => false
    	t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.string :phone
    	t.integer :default_shipping
    	t.integer :default_billing
    	t.boolean :is_deleted, :default => false

      t.timestamps null: false
    end
  end
end
