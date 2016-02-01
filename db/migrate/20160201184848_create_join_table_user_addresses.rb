class CreateJoinTableUserAddresses < ActiveRecord::Migration
  def change
    create_join_table :users, :addresses do |t|
      t.index [:user_id, :address_id]
      t.index [:address_id, :user_id]
    end
  end
end
