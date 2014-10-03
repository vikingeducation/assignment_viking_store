class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	# method to add user_id as ref
    	t.string 	:address
    	t.string	:city
    	t.string	:state
    	t.string	:zip

      t.timestamps
    end
  end
end
