class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :name
      t.string :cc_number
      t.date :expiration
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
