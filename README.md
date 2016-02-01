viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

Viking Store

Sam
https://github.com/samok13

John
https://github.com/koziscool

From
http://vikingcodeschool.com

//

User-email, name, phonenum, shipping address, billing address, cc info
-->multiple shipping addresses possible
-->default value
(same for billing add)

User (one) -> shipping add (many)
User (one) -> billing add (many)

Product-title, description, price, SKU
Categories-descriptions

Category (one) -> products (many)

Shopping cart(many)-products (many)

Shopping cart(one) -> order (one)

Tables-Columns
User-email, name, phonenum, billing address, cc info
Address-userid, addresstype, street, city, stateid, zipid
State-states
Zip Code-zipcode
Product-description, price
Category-description
OrderProduct-productid, quantity, price
Order-id, userid, orderdate