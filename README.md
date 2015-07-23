viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

By:

* [David Meza](https://github.com/david-meza/)
* [Olga Ayvazyan](https://github.com/ayva)

Assignment part of [Viking Code School](http://www.vikingcodeschool.com/) curriculum

#Model

Entities: User, Address, Order, Shipping, Credit Card

Relationships:

    User -> Address - One Users : Many Adresses
                      One Adress : Many Users

    Credit Card -> Adress - Many Credit Card : One Billing Address

    User -> Credit Card - One user : Many Credit Cards
                          One Credit Card : Many users

    Product -> Shipment - One Product : Many Shipments
                        One Shipment : Many Products


    Shipment -> Address -  1 Shipment : 1 Address
                        1 Address : Many Shipments

    Shipment -> User - 1 Shipment : 1 User
                    1 User : Many Shipments

    Shipment -> CC# - 1 Shipment : 1 Credit Card


Tables:

User: 1) User ID, int (PK) - Implicit
      2) First_name, string, 1-40 char
      3) Last_name, string, 1-40 char
      4) Email, string, 5-40 char
      5) Default Address ID
      6) Password
      7) phone

Address 1) Address ID, int (PK) - Implicit
        2) City, string < 30 char
        3) state, string < 30 chars
        4) country, string < 30 chars
        5) zip code, string (optional)
        6) Building #, int (optional)
        7) street name, string < 50 chars
        8) apt #, string < 5 char

JOIN Shipment 1) User_ID
              2) Shipment_Address_ID
              2) pack date, datetime
              3) ship date, datetime
              4) arrival date, datetime

Billing:       1) credit card #, int (PK)
                2) first_name on card, string < 50 char
                3) last_name on card
                3) exp. date, date(MM/YY)
                4) CVC, int, 3-4 digits
                5) type of card, string, 2 char
                6) Billing_address_ID, int (FK)

JOIN Billing_User 1) User_id
                  2) billing_id

 Product:  1) name, string 1-50 char
              2) description, string, 500 char
              3) price, float
              4) amount in stock, int >= 0
              5) Product ID, int (PK)

JOIN Product_Order 
                      1) Order #, int (FK)
                      2) Product ID, int (FK)
                      3) Quantity of Product in the order, int > 0


    Order:  1) Order #, int (PK)
            2) billing_id, int (FK)
            3) User_id, string (FK)
            4) shipping_ID, int (FK)






