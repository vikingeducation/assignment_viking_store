viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

Anthony Sin

##

user --> email, name
user (if going to order) --> phone_number, shipping address, billing address, credit card
multiple addresses allowed but only one default (for both shipping and billing)

product --> title, description, price, SKU number, ONE category
category --> description

shopping cart --> items, quantities, available for next login, shipping and billing address

## 

| users:     |         |          |
|------------|---------|----------|
| id         | integer |          |
| first_name | string  | required |
| last_name  | string  | required |
| email      | string  | required |

first name (string), required
last name (string), required
email (string), required
has many addresses
has many credit cards

addresses
id (integer)
user id (integer)


belongs to users

credit_cards

belongs to 


