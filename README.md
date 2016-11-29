viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

Felipe Suero
Jake Tingley

Entities
========
users
products
shopping_cart
addresses
orders
categories

Attributes
===========
users
  username, string
  email, string
  phone number, string
  shipping address, fk
  billing address, fk
  cc information, ?????

products
  title, string
  description, text
  price, float
  sku, string
  category, string

category
  tag, string

shopping_cart
  billing address, fk
  shipping address, fk
  user, fk
  checked_out, boolean

addresses
  user, fk
  street, string
  city, string
  state, fk
  country, fk

state
  state, string

country
  country, string

Relationships
==============

products/shopping_cart - many to many
  product fk
  shopping_cart fk
  product_quantity
