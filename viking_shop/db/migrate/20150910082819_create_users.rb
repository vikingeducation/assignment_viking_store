class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username,    null: false
      t.string  :email,            null: false
      t.string  :phone,           null: false
      t.integer  :ship_add,       null: false
      t.integer  :bill_add,         null: false
      t.integer  :sub_add
      #t.integer  :payment,       null: false

      t.timestamps null: false
    end
  end
end
