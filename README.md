viking_store
============

Mike and Alice
https://github.com/mikebutts/assignment_viking_store.git
https://github.com/alicefung/assignment_viking_store.git
The Viking Store e-commerce application for Viking Commerce Inc




Table 1: Users
id   first_name   last_name   emails
int  string       string      string

Table 2: Addresses *street =first line           #now has 150 address
id   street    city    state    zip
int  string    string  string   int

Table 3: Users-Addresses Join: aka User_address   #
UserID   AddressID
int      int

Table 4: Billing
id   UserID  AddressID   cc_type   cc_number   cc_ext
int  int     id          string    int         date

Table 5: Products
id   name    description   price   stock
int  string  string        int     int

Table 6: Orders
id   UserID checkout
int  id        datetime

Table 7: Packing_list
ProductID   OrderID   Quantity
int         int       int

<!-- Table 8: Shipments
id   OrderID   shipping_label
int  int       string

Table 9: ShipRates
weight   price
int      int -->
