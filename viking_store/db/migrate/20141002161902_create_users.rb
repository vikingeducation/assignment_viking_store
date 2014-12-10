class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string   :first_name,  null: false
    	t.string   :last_name,   null: false
    	t.string   :email,       null: false
    	t.integer  :phone_number

      t.integer  :default_billing_id
      t.integer  :default_shipping_id
      t.timestamps 
    end
  end
end
