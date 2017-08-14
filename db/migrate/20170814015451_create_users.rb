class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email_address

      t.timestamps
    end

    add_index :users, :email_address, unique: true
  end
end
