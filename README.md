User
- credentials(email, pw)
- name

CustomerInfo
- user_id
- shipping address, billing address, credit card, phone number

Order
- customerinfo_id
- cart_id
- delivered_at

Address
- user_id
- is_primary:bool
- is_billing:bool
- is_shipping:bool

Product
- product title
- description
- price
- SKU number

Cart
- user_id
- products:references
- cart will have products; upon checkout, make new order based on
  these products and the user, and new order will point to cart
- checked_out:bool

User -> Cart(products)

User -> CustomerInfo.new

CustomerInfo -> Cart

*Rails makes new Order*
Order.new
Order -> CustomerInfo
Order -> Cart
Cart -> CustomerInfo

Cart => checkout:true



SELECT 
FROM orders JOIN carts ON order.user_id = product.user_id




Order -> User
- get_user_products(user_id)
- This is User's products and their respective quantities:
(a) Product a => 123 (Cart),
(b) Product b => 5 (Cart),
(c) Product c => 20 (Cart)

Cart
- user_id
- Each cart has an order. These are its orders!
- checked_out:true then is_order
- order_num column; use this to distinguish between 
  checked_out carts('orders')
- look for the user_id in the cart
- cart is a container for all user's products and their respective
  quantities
(a) Product => Quantity
(b) Product => Quantity
(c) Product => Quantity

Order
- stated_delivery_date
- actual_delivery_date
- contains many carts
- will live in the Cart

            Order
          /       \
        Cart A    Cart B
      /     \         \
Product    Product      Product