class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :default

      t.timestamps
    end

    add_reference :addresses, :user, foreign_key: true
  end
end
