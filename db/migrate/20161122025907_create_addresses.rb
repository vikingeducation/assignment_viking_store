class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|

    	t.string :street
    	t.string :city
    	t.string :state
    	t.string :zip_code

    	t.integer :profile_id

      t.timestamps
    end
  end
end
