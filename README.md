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
- customerinfo_id
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
