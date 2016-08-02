User

* First Name req
* Last Name req
* email:string req
* phone:string
* Default billing: LocationID
* Default Shipping: LocationID

Locations

* User ID
* State
* ZIP
* Street Address
* City

Payments

* User ID
* Name
* Credit Card number
* Expiration date
* Location ID

Products

* Title
* Description
* Price
* SKU
* Categories

Category

* name

Orders

* User ID
* Payment ID
* Billing Location ID
* Open boolean default:true

Item

* OrderID
* ProductID
* Quantity
* Unit Price

Shipments

* To: Location ID
* From: Location ID
* Order ID