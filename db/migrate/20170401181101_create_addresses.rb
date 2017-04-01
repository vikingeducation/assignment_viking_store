class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :state_id
      t.integer :city_id
      t.string :street
      t.string :home_no
      t.string :post_code

      t.timestamps
    end
  end
end
