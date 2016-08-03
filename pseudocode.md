class CreateJoinTableProductsOrders < ActiveRecord::Migration
  def change
    create_join_table :products, :orders do |t|
      t.index :product_id
      t.index :order_id
      t.integer :product_amount
    end
  end
end

rails g model User
rails g model Order
rails g model Product
rails g model Category
rails g model Address
rails g model CreditCard
rails g model Product
rails g migration CreateJoinTableProductsOrders


User
  email - string - required
  first_name - string - required
  last_name - string - required
  phone number - string
  default\_billing\_foreign_key
  default\_shipping\_foreign_key

Order
  phone number - string - required
  placed - boolean - default:false
  delivered - boolean - default:false
  user\_foreign\_key - integer - required
  shipping\_address\_foreign_key - integer - required 
  billing\_address\_foreign_key - integer - required
  credit\_card\_foreign_key

Product/Order 
  product_id - integer
  order_id - integer
  no\_of\_items - integer

Product
  title - string
  description - text
  price - float
  sku - string
  category\_foreign\_key - integer

Category
  title - string
  description - text

Address
  street_address - string
  city - string
  state - string
  zip - string
  country - string 
  user\_foreign\_key - integer

Credit Card
  vendor - string - required
  number - integer - required
  csc - integer - required
  expiration - date - required
  user\_foreign\_key - integer
  on_file - boolean - default:true

