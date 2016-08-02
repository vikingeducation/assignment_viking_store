Relationships:
User has many Addresses : Address has many Users
User has many credit cards : Credit card has one user
User has many phone numbers : Phone number has many Users

Order has many products : Product has many orders
Category has many Products : Product has one category

Entities:
User (email, name),
Addresses: (location, default_flag)
Credit_cards: (number, user_id)
Phone_numbers: (number)
Users/Addresses Join Table
Product/Order Join Table (quantity)
Product(title, description, price, SKU_number, category_id)
Order(created_date)
Shipment(shipping_address)
Categories(type)
