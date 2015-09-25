class CreateCreditCardCompanies < ActiveRecord::Migration
  def change
    create_table :credit_card_companies do |t|
      t.string :name, :limit => 32

      t.timestamps null: false
    end
  end
end
