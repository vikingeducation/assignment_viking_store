class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
    	t.string :cc_number
    	t.timestamps :expiration_date
    	t.string :code

      	t.timestamps
    end
  end
end
