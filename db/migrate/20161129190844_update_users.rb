class UpdateUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string, :unique => true
    add_column :users, :phone_number, :string

    add_index :users, :id, :unique => true
  end
end
