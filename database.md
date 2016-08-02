Tables
- User
  - email (string)
  - first_name (string)
  - last_name (string)
  - phone_num (string)
  - default_shipping (reference: address_id)
  - default_billing (reference: address_id)
- Card
  - number (string)
  - company (string)
  - exp_date (date)
  - security_code (string)
  - user_id (reference)
- Address
  - user_id (reference)
  - city (string)
  - state (string)
  - zip (string)
  - address_line_1 (string)
  - address_line_2 (string)
- Product
  - title (string)
  - description (text)
  - price (float)
  - SKU (string)
  - category_id (reference)
- Category
  - name (string)
  - description (text)
- Orders
  - user_id (reference)
  - processed_date (date)
  - shipping_address (not a reference) (string)
  - billing_address (not a reference) (string)
- OrderProduct
  - order_id (reference)
  - product_id (reference)
  - quantity (integer)

  Address belongs to user, user has many addresses.
  Card belongs to user, user has one card.
  Product has one category. Category has many products.
  Order has one user. User has many orders.
  Order has many products. Products have many orders.

