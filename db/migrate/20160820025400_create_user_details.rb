class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.string  :phone_number

      t.timestamps
    end

    add_reference :user_details, :user, index: true
    add_foreign_key :user_details, :users
  end
end
