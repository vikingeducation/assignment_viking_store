class ChangeCreditCardNumberToString < ActiveRecord::Migration
  change_column(:credit_cards, :credit_card_number, :string)
end
