class RemoveCreditCardFromUsers < ActiveRecord::Migration[5.0]
  def change
  end
  remove_column :users, :credit_card
end
