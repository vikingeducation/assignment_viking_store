MODELS:
x  User
x  Category
x  Product
x  Cart
x  Order
x  CreditCard
x  Shipment
x  Address
x  Country
x  State
x  City

* everything is required unless marked with :null => true

User: (One to One with Cart) (One to Many with Order) (One to Many with Address)
  Email [string, :unique => true]
  First Name [string]
  Last Name [string]

Product: (Many to One with Categories)
  Title [string]
  Description [text]
  Price [float]
  SKU Number [string, :unique => true]
  Category ID (Foreign Key)

Category: (One to Many with Products)
  Name [string, unique: true]

Cart: (Many to Many with Products) (One to One with User)
  User ID (Foreign Key)

JoinCartWithProduct: (Cart Contents)
  Cart ID
  Product ID
  Product Quantity [integer]

Order: (Many to One with User)
  User ID (Foreign Key)
  Cart ID (Foreign Key)
  Phone Number [string]
  Credit Card ID (Foreign Key)

Credit Cards:
  User ID (Foreign Key)
  Number [string, :unique => true]
  Type [string]
  Expiration [string]
  Security Code [integer]
  Default (true/false) [boolean]

Shipment:
  Order ID (Foreign Key)
  Billing Address ID (Foreign Key) (default is default id)
  Shipping Address ID (Foreign Key) (default is default id)

Address: (Many to One with User) (Default billing, default shipping, multiple of each)
  User ID (Foreign Key)
  Street Address [string]
  City ID (Foreign Key)
  State ID (Foreign Key)
  Country ID (Foreign Key)
  Address Type (billing/shipping) [string]
  Zip Code [integer]
  Default (true/false) [boolean]

Country:
  Name [string, :unique => true]

State:
  Name [string]
  Country ID (Foreign Key)

City:
  Name [string]
  State ID (Foreign Key)

  validates :type, inclusion: { in: ['billing', 'shipping'],
        message: "#{value} is not a valid address type." }