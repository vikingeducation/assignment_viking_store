class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :default_billing
      t.integer :default_shipping

      t.timestamps null: false
    end
  end
end
