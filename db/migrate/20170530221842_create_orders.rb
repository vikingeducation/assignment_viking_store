class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      add_reference :ship_adds, :users, index: true
      add_reference :bill_adds, :users, index: true
      add_reference :orders, :users, index: true
      t.string :email
      t.string :fname
      t.string :lname
      t.string :phone
      t.timestamps
    end

    create_table :ship_adds do |t|
      add_reference :states, :ship_adds, index: true
      t.belongs_to :users, index: true
      t.boolean :default
      t.string :add_num
      t.string :street
      t.string :city
      t.string :zip
      t.string :country
      t.timestamps
    end

    create_table :bill_adds do |t|
      add_reference :states, :bill_adds, index: true
      t.belongs_to :users, index: true
      t.boolean :default
      t.string :add_num
      t.string :street
      t.string :city
      t.string :zip
      t.string :country
      t.timestamps
    end

    create_table :states do |t|
      t.belongs_to :ship_adds, :states, index: true
      t.belongs_to :bill_adds, :states, index: true
      t.string :name
      t.timestamps
    end

    create_table :products do |t|
      t.belongs_to :categories, :products, index: true
      add_reference :orders, :products, index: true
      t.string :title
      t.text :description
      t.float :price
      t.string :sku
      t.timestamps
    end

    create_table :categories do |t|
      add_reference :products, :categories, index: true
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :orders do |t|
      add_reference :products, :orders, index: true
      add_reference :carts, :orders, index: true
      t.belongs_to :users, index: true
      t.integer :quantity
      t.timestamps
    end

    create_table :carts do |t|
      t.belongs_to :orders, index: true
      t.timestamps
    end

    create_table :order_statuses do |t|
      add_reference :order_statuses, :orders, index: true
      t.integer :code
      t.string :name
    end
  end
end
