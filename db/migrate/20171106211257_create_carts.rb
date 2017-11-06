class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      t.references :credit_card, foreign_key: true

      t.timestamps
    end
  end
end
