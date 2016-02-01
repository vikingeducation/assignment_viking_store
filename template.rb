User: (One to One with Cart) (One to Many with Order) (One to Many with Address)
  Email
  First Name
  Last Name

Product: (Many to One with Categories)
  Title
  Description
  Price
  SKU Number
  Category ID (Foreign Key)

Category: (One to Many with Products)
  Name

Cart: (Many to Many with Products) (One to One with User)
  User ID (Foreign Key)

JoinCartWithProduct: (Cart Contents)
  Cart ID
  Product ID
  Product Quantity

Order: (Many to One with User)
  User ID (Foreign Key)
  Cart ID (Foreign Key)
  Phone Number
  Credit Card ID (Foreign Key)

Credit Cards:
  User ID (Foreign Key)
  Number
  Type
  Expiration
  Security Code
  Default (true/false)

Shipment:
  Order ID (Foreign Key)
  Billing Address ID (Foreign Key) (default is default id)
  Shipping Address ID (Foreign Key) (default is default id)

Address: (Many to One with User) (Default billing, default shipping, multiple of each)
  User ID (Foreign Key)
  Street Address:
  City ID (Foreign Key)
  State ID (Foreign Key)
  Country ID (Foreign Key)
  Address Type (billing/shipping)
  Zip Code
  Default (true/false)

Country:
  Name

State:
  Name
  Country ID (Foreign Key)

City:
  Name
  State ID (Foreign Key)