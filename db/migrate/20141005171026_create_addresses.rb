class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :user_id, :null => :false
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.boolean :is_inactive, :default => :false
      t.timestamps
    end
  end
end
