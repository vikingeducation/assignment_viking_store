class AddFkToPayment < ActiveRecord::Migration[5.0]
  def change
  		add_column :payments, :user_id, :integer
  		add_foreign_key :payments, :users
  end
end
