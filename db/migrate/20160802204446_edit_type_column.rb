class EditTypeColumn < ActiveRecord::Migration
  def change
    remove_column :credit_cards, :type
    add_column :credit_cards, :card_type, :string
  end
end
