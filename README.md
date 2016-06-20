# Viking Store

The Viking Store e-commerce application for Viking Commerce Inc. An assignment completed for [Viking Code School](http://vikingcodeschool.com) by [Stephen Mayeux](https://github.com/StephenMayeux).

## Data Models

### User Model

1. id, primary key
2. email, valid format and unique, required field
3. first_name, one character minimum, required field
4. last_name, one character minimum, required field


### Address Model

1. id, primary key
2. user_id, foreign key
3. street_address, valid format, required
4. city_id, foreign key
5. state_id, foreign key
6. zip_code, 5 digits, required

### City Model

1. id, primary key
2. name, string

### State Model

1. id, primary key
2. name, two characters only, required

### Billing Model

1. id, primary key
2. user_id, foreign key
3. address_id, foreign key
4. payment_id, foreign key

### Payment Model

1. id, primary key
2. user_id, foreign key
3. number, 16 digits required
4. card_type
5. expiration
6. security code

### Product Model

1. id, primary key
2. category_id, foreign key
3. title, 5 characters minimum, required
4. description, text, 25 characters minimum, required
5. price, number, required
6. SKU, 10 digit number required

### Category Model

1. id, primary key
2. title, required

### Order Model

1. id, primary key
2. user_id, primary key
3. checkout_time, datetime

### Shopping Cart Model

1. id, primary key
2. order_id,
3. product_id
4. quantity
