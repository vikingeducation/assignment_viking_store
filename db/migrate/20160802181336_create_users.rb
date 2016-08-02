class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone 
      t.references :default_shipping, references: :address
      t.references :default_billing, references: :address
      
      t.timestamps
    end
  end
end
