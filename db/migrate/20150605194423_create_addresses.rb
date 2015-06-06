class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.integer :user_id
    	t.string :first_line
    	t.string :second_line
    	t.string :city
    	t.string :state, :limit => 2
    	t.integer :zip

      t.timestamps null: false
    end
  end
end
