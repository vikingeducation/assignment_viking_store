class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :phone_number
    	t.string :credit_card

    	# method for creating billing address ref
    	# method for creating shipping address ref
      t.timestamps
    end
  end
end
