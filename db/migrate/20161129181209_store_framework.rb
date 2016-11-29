class StoreFramework < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :phone_number
      t.string  :email
      add foreign_key :shipping_address,
                      :billing_address

      t.timestamps
    end

  end
end
