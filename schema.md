# Questions

1. If a user can have a varying number of addresses, how many would be the max? Should the database be enabled to store unlimited addresses associated with a user or just the default shipping and billing addresses?

If the user should have as many shipping/billing addresses as they want.. perhaps a join table?

2. Is it generally OK and efficient to store a status of an order in a separate table (OrderStatus)? Specifically pertaining to if it should be evaluated as a cart, purchase, part of a shipment etc...

This would work as follows, if the order's `status_id` is:

- 'not_purchased' it is a cart
- 'purchased' it is a purchase
- 'shipping' it is in route
- 'delivered' it is delivered
- 'refunded' it is refunded
- etc.. allows for scaling

This approach also strikes me as applicable to shipments (ShipmentStatus). Is this a good approach?

3. Storing credit cards in their own table? Credit card companies too? Phone numbers in their own table?

---

Users

- id SERIAL
- email VARCHAR(255)
- username VARCHAR(32)

---

Profiles

- id SERIAL
- first_name VARCHAR(32)
- last_name VARCHAR(32)
- phone_number VARCHAR(15)
- credit_card_id INTEGER FK
- billing_address_id INTEGER FK
- shipping_address_id INTEGER FK
- user_id INTEGER FK

---

CreditCards

- id SERIAL
- number VARCHAR(19)
- expiration_date DATE
- company_id INTEGER FK

---

CreditCardCompanies

- id SERIAL
- name VARCHAR(32)

---

Cities

- id SERIAL
- name VARCHAR(32)
- state_id INTEGER FK

---

States

- id SERIAL
- name VARCHAR(32)
- country_id INTEGER FK

---

Countries

- id SERIAL
- name VARCHAR(32)

---

ZipCodes

- id SERIAL
- code VARCHAR(32)
- state_id INTEGER FK

---

Products

- id SERIAL
- name VARCHAR(32)
- description TEXT
- units INTEGER
- sku VARCHAR(255) UNIQUE
- price DECIMAL(9,2)

---

ProductCategories

- id SERIAL
- name VARCHAR(255)
- description TEXT

---

Orders

- id SERIAL
- order_status_id INTEGER
- user_id INTEGER FK
- shipment_id INTEGER FK

---

OrderItem

- id SERIAL
- order_id INTEGER
- product_id INTEGER FK

---

OrderStatuses

- id SERIAL
- name VARCHAR(32)

---

Shipments

- id SERIAL
- destination_id INTEGER FK
- shipment_status_id INTEGER FK

---

ShipmentStatuses

- id SERIAL
- name VARCHAR(32)

---

Addresses

- id SERIAL
- street VARCHAR(255)
- post_office_box VARCHAR(255)
- city_id INTEGER FK
- state_id INTEGER FK
- zip_code_id INTEGER FK
- country_id INTEGER FK











