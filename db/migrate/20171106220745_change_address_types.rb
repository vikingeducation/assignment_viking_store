class ChangeAddressTypes < ActiveRecord::Migration[5.1]
  def change
    change_table :addresses do |t|
      t.remove :city
      t.remove :state

      t.references :state, foreign_key: true
      t.references :city, foreign_key: true
    end
  end
end
