viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

Anthony Sin

## Database

| users          |         |          |
|----------------|---------|----------|
| id             | integer |          |
| first_name     | string  | required |
| last_name      | string  | required |
| email          | string  | required |
| phone_number   | string  |          |
| shipping_id    | integer |          |
| billing_id     | integer |          |
| credit_card_id | integer |          |

| addresses     |         |          |
|---------------|---------|----------|
| id            | integer |          |
| user_id       | string  | required |
| street_line_1 | string  | required | 
| street_line_2 | string  |          |
| city_id       | integer | required |
| state_id      | integer | required |
| zip           | string  | required |

| cities |         |          |
|--------|---------|----------|
| id     | integer |          |
| name   | string  | required |

| states       |          |          |
|--------------|----------|----------|
| id           | integer  |          |
| abbreviation | string   | required |

| credit_cards |         |          |
|--------------|---------|----------|
| id           | integer |          |
| user_id      | integer | required |
| number       | string  | required |
| cvv          | string  | required |
| month_exp    | integer | required |
| year_exp     | integer | required |

| products    |         |          |
|-------------|---------|----------|
| id          | integer |          |
| category_id | integer | required |
| title       | string  | required |
| description | text    | required |
| price       | decimal | required |
| SKU         | string  | required |

| categories  |         |          |
|-------------|---------|----------|
| id          | integer |          |
| name        | string  | required |
| description | text    | required |

| orders        |          |          |
|---------------|----------|----------|
| id            | integer  |          |
| user_id       | integer  | required |
| shipping_id   | integer  |          |
| billing_id    | integer  |          |
| checkout_date | datetime |          |

| items      |         |          |
|------------|---------|----------|
| id         | integer |          |
| order_id   | integer | required |
| product_id | integer | required |
| quantity   | integer | required |



