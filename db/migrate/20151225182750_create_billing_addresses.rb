class CreateBillingAddresses < ActiveRecord::Migration
  def change
    create_table :billing_addresses do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.boolean :default_billing, default: false, null: false
      t.string :line_1, null: false
      t.string :line_2
      t.references :city, index: true, foreign_key: true, null: false
      t.references :state, index: true, foreign_key: true, null: false
      t.string :zip, null: false

      t.timestamps null: false
    end
  end
end
