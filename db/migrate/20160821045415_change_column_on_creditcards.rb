class ChangeColumnOnCreditcards < ActiveRecord::Migration[5.0]
  def change
    change_column :credit_cards, :ccv, :string
  end
end
