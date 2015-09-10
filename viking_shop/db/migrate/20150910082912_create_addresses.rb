class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :first_add,        null: false
      t.string :second_add,   null: false
      t.string :city,                 null: false
      t.string :state,               null: false

      t.timestamps null: false
    end
  end
end
