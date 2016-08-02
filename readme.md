Relationships:
User has many Addresses : Address has many Users
User has many credit cards : Credit card has one user
User has many phone numbers : Phone number has many Users

Order has many products : Product has many orders
Category has many Products : Product has one category

Entities:
User (email, name, phone_numbers, addresses, credit_cards),
Addresses: (location, default_flag, user_id)
Credit_cards: (number, user_id)
Phone_numbers: (number, user_id)
Users/Addresses Join Table
Product/Order Join Table (quantity)
Product(title, description, price, SKU_number, category_id)
Order(created_date)
Shipment(shipping_address)
Categories()
