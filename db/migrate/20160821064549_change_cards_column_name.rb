class ChangeCardsColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :credit_cards, :type, :brand
  end
end
