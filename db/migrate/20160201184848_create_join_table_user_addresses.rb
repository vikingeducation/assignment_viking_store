class CreateJoinTableUserAddresses < ActiveRecord::Migration
  def change
    create_join_table :users, :addresses do |t|
      t.string :default
    end
  end
end
