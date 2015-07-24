class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.integer   :user_id,     null: false
      t.integer   :address_id,  null: false

      t.timestamps              null: false
    end
  end
end
