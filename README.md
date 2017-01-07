viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

Tingting

USER
id (PRIMARY)
first name, string 1-30 chars, req
last name, string 1-30 chars, req
email, string 5-50 chars, req
phone, string 20?? chars
credit card id (FOREIGN)
shipping_id (FOREIGN)
billing_id (FOREIGN)

CREDIT CARD
user id (FOREIGN)
number, string
exp, string
ccv, string

ADDRESSES
id (PRIMARY)
user id (FOREIGN)
street, string
city id (FOREIGN)
state id (FOREIGN)
zip, string

CITY
id (PRIMARY)
name, string

STATE
id (PRIMARY)
name, string

PRODUCT
name, string
price, string
sku, string
category id (FOREIGN)

CATEGORY
id (PRIMARY)
name, string

PRODUCT ORDER JOIN TABLE
id (PRIMARY)
product id (FOREIGN)
quantity integer
order id (FOREIGN)

ORDERS
id (PRIMARY)
billing (FOREIGN)
shipping (FOREIGN)
checkout, datetime
user (FOREIGN)