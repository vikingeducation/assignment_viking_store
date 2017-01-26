class AddJoinDateToUser < ActiveRecord::Migration[5.0]
  def change
  		add_column :users, :join_date, :timestamp
  end
end
