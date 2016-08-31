============
viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

### Deepak

## Datamodel
---
Users

- id          SERIAL
- firstname   STRING
- lastname    STRING
- email       STRING
- billing_id  INTEGER FK
- shipping_id INTEGER FK

---
Addresses

- id          SERIAL
- line_1      STRING
- line_2      STRING
- zip_code_id INTEGER FK
- user_id     INTEGER FK

---
ZipCodes

- id       SERIAL
- code     INTEGER
- state_id INTEGER FK

---
States

- id         SERIAL
- name       STRING
- country_id INTEGER FK

---
Cities

- id       SERIAL
- name     STRING
- state_id INTEGER FK

---
Countries

- id    SERIAL
- name  STRING

---
Orders

- id          SERIAL
- order_date  DATETIME
- user_id     INTEGER FK
- billing_id  INTEGER FK
- shipping_id INTEGER FK
- phone       STRING
- credit_card STRING

---
Products

- id          SERIAL
- name        STRING
- description TEXT
- category_id INTEGER FK
- units       INTEGER
- sku_number  UNIQUE STRING

---
Categories

- id          SERIAL
- name        STRING
- description TEXT

---
OrderItem

- id         SERIAL
- order_id   INTEGER FK
- product_id INTEGER FK
- quantity   INTEGER
