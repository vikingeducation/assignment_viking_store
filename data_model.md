# Data Model for the Viking Store

User
  - first_name (String, required)
  - last_name (String, required)
  - password (String, required)
  - email_address (String, required, unique)
  - default_billing_address (foreign key)
  - default_shipping_address (foreign key)

CreditCard
  - card_number (String, required, unique, 16 digits)
  - expiry_date (Date, required)
  - user_id (foreign key, required)

Address
  - address (String, required)
  - city (foreign key, required)
  - state (foreign key, required)
  - country (foreign key, required)
  - zipcode (String, required)
  - phone_number (String, required)
  - address_type_id (foreign key, required)
  - user_id (foreign key, required)

AddressType
  - type (String, required)

City
  - name (String, required)
  - state_id (foreign key, required)

State
  - name (String, required)
  - country_id (foreign key, required)

Country
  - name (String, required)

Product
  - title (String, required)
  - description (String, required)
  - price (Number, required, positive number)
  - sku (String, required, unique)
  - stock (Number, required, positive integer)
  - product_category_id (foreign key, required)

ProductCategory
  - title (String, required)
  - description (String, required)

ShoppingCart
  - user_id (foreign key, required)

ShoppingCartProduct
  - product_id (foreign key, required)
  - quantity (Number, required, positive integer)
  - shopping_cart_id (foreign key, required)

Order
  - shipping_date (Datetime, required)
  - fulfilled (Boolean, required, default: false)
  - user_id (foreign key, required)
  - shipping_address_id (foreign key, required)
  - billing_address_id (foreign key, required)

OrderProduct
  - product_id (foreign_key, required)
  - quantity (Number, required, positive integer)
  - order_id (foreign key, required)
