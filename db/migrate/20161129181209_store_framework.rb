class StoreFramework < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :phone_number
      t.string  :email
      t.integer :shipping_address_id
      t.integer  :billing_address_id
      t.string :credit_card

      t.timestamps
    end

    create_table :products do |t|
      t.string  :title
      t.text    :description
      t.float   :price
      t.string  :sku
      t.integer  :category_id

      t.timestamps
    end

    create_table :category do |t|
      t.string :tag

      t.timestamps
    end

    create_table :shopping_cart do |t|
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.integer :user_id
      t.boolean :checked_out

      t.timestamps
    end


    create_table :addresses do |t|
      t.integer :user_id
      t.integer :state_id
      t.integer :country_id
      t.string  :city
      t.string  :street
      t.timestamps
    end

    create_table :state do |t|
      t.string :state
      t.timestamps
    end

    create_table :country do |t|
      t.string :country
      t.timestamps
    end

    create_table :prod_to_cart do |t|
      t.integer :product_id
      t.integer :shopping_cart_id
      t.integer :amount
      t.timestamps
    end

  end
end
