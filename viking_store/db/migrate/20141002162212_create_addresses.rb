class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.integer  :user_id
    	t.string 	 :street_address
    	t.string	 :city
    	t.string	 :state
    	t.integer	 :zip
      
      t.timestamps
    end
  end
end
