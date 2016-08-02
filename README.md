Viking Store
============

## Authors
Morgan and Vishal.

## Description
The Viking Store e-commerce application for Viking Commerce Inc

[Viking Code School](https://vikingcodeschool.com)

## Date Model

### System Goals and User Needs
They keep track of users who sign up on their website. For each user, they
require an email and name to sign up. If that customer goes on to complete
an order, they must also add a phone number, shipping address, billing
address, and credit card information. The customer can save multiple
addresses, but only one of these will be the default address added to new
orders as the shipping address and the same for the billing address.

They keep track of their product listings on the website, each of which
contains the product title, description, price, SKU number. These products
are grouped into categories which have their own descriptions. Each product
is only grouped into a single category.

Customers add items (of varying quantity) to their shopping carts, which are
available for them whenever they next login, even if it's months later. When
the customer checks out, their cart becomes an order. That order might ship
to any one of the customer's listed shipping addresses, though it defaults to
their default shipping address, and it may bill to any of the addresses on
file as well (though it defaults to their default billing address).

### Entities

User
email | first_name | last_name
