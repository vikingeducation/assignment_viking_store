User

* First Name req
* Last Name req
* email:string req
* phone:string
* Default billing: LocationID
* Default Shipping: LocationID

Location

* User ID:int
* State: (own table?)
* ZIP:string
* Street Address:string
* City:string

Payments

* users_ID:int
* Name:string
* Credit Card number:string
* Expiration date:date
* Location ID:int

Products

* Title:string
* Description:text
* Price:int
* SKU:string
* Category_id:int

Category

* name:string
* description:text

Orders

* users_id:int
* payment_id:int
* billing_location_id:int
* Open_order:boolean default:true

Item

* OrderID:int
* ProductID:int
* Quantity:int
* Unit Price:int

Shipments

* To_location ID: int
* From_Location ID:int
* Order ID:int