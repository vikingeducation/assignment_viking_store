class AddTypeToCreditCard < ActiveRecord::Migration
  def change
    add_column :credit_cards, :type, :string
  end
end
