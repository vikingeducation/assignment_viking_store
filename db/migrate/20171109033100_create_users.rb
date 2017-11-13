class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :default_mail_address_id
      t.integer :default_bill_address_id
      t.string :phone
      t.timestamps
    end
  end
end
