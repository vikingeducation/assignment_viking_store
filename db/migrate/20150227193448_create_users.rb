class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :shipping_address
      t.string :billing_address
      t.string :payment_card

      t.timestamps null: false
    end
  end
end
