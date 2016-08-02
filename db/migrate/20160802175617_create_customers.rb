class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :user
      t.credit_card :string
      t.phone_number :string
      t.timestamps
    end
  end
end
