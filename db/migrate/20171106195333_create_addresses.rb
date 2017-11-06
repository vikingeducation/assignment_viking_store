class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :type, default: 0
      t.references :user, foreign_key: true
      t.string :street
      t.string :state
      t.string :city
      t.string :zipcode
      t.string :phone_number
      t.string :name
      t.boolean :default

      t.timestamps
    end
  end
end
