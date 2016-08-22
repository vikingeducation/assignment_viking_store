class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer   :state_id,    null: false
      t.integer   :city_id,     null: false
      t.integer   :user_id,     null: false
      t.string    :secondary_address
      t.string    :street_address,  null: false
      t.integer   :zip_code,    null: false
      t.timestamps
    end
  end
end
