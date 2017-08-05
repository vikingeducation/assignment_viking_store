class AddCreditCardToOrder < ActiveRecord::Migration[5.0]
  def change
     add_column :orders, :credit_card_id, :integer
  end
end
