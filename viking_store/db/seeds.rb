# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])



Country.create([
  {
    name: "United States",
    abbr: "US"
  }])

State.create([
  {
    name: "Alabama",
    abbr: "AL"
  },
  {
    name: "Alaska",
    abbr: "AK"
  },
  {
    name: "Arizona",
    abbr: "AZ"
  },
  {
    name: "Arkansas",
    abbr: "AR"
  },
  {
    name: "California",
    abbr: "CA"
  },
  {
    name: "Colorado",
    abbr: "CO"
  },
  {
    name: "Connecticut",
    abbr: "CT"
  },
  {
    name: "Delaware",
    abbr: "DE"
  },
  {
    name: "Florida",
    abbr: "FL"
  },
  {
    name: "Georgia",
    abbr: "GA"
  },
  {
    name: "Hawaii",
    abbr: "HI"
  },
  {
    name: "Idaho",
    abbr: "ID"
  },
  {
    name: "Illinois",
    abbr: "IL"
  },
  {
    name: "Indiana",
    abbr: "IN"
  },
  {
    name: "Iowa",
    abbr: "IA"
  },
  {
    name: "Kansas",
    abbr: "KS"
  },
  {
    name: "Kentucky",
    abbr: "KY"
  },
  {
    name: "Louisiana",
    abbr: "LA"
  },
  {
    name: "Maine",
    abbr: "ME"
  },
  {
    name: "Maryland",
    abbr: "MD"
  },
  {
    name: "Massachusetts",
    abbr: "MA"
  },
  {
    name: "Michigan",
    abbr: "MI"
  },
  {
    name: "Minnesota",
    abbr: "MN"
  },
  {
    name: "Mississippi",
    abbr: "MS"
  },
  {
    name: "Missouri",
    abbr: "MO"
  },
  {
    name: "Montana",
    abbr: "MT"
  },
  {
    name: "Nebraska",
    abbr: "NE"
  },
  {
    name: "Nevada",
    abbr: "NV"
  },
  {
    name: "New Hampshire",
    abbr: "NH"
  },
  {
    name: "New Jersey",
    abbr: "NJ"
  },
  {
    name: "New Mexico",
    abbr: "NM"
  },
  {
    name: "New York",
    abbr: "NY"
  },
  {
    name: "North Carolina",
    abbr: "NC"
  },
  {
    name: "North Dakota",
    abbr: "ND"
  },
  {
    name: "Ohio",
    abbr: "OH"
  },
  {
    name: "Oklahoma",
    abbr: "OK"
  },
  {
    name: "Oregon",
    abbr: "OR"
  },
  {
    name: "Pennsylvania",
    abbr: "PA"
  },
  {
    name: "Rhode Island",
    abbr: "RI"
  },
  {
    name: "South Carolina",
    abbr: "SC"
  },
  {
    name: "South Dakota",
    abbr: "SD"
  },
  {
    name: "Tennessee",
    abbr: "TN"
  },
  {
    name: "Texas",
    abbr: "TX"
  },
  {
    name: "Utah",
    abbr: "UT"
  },
  {
    name: "Vermont",
    abbr: "VT"
  },
  {
    name: "Virginia",
    abbr: "VA"
  },
  {
    name: "Washington",
    abbr: "WA"
  },
  {
    name: "West Virginia",
    abbr: "WV"
  },
  {
    name: "Wisconsin",
    abbr: "WI"
  },
  {
    name: "Wyoming",
    abbr: "WY"
  },
])

5.times do
  Category.create( name: Faker::Hipster.words(1),
                  description: Faker::Hipster.sentence(1) )
end


100.times do
  user = User.create(   first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        email: Faker::Internet.email,
                        password: Faker::Internet.password )

  address = Address.create( street: Faker::Address.street_address,
                            city: Faker::Address.city,
                            state_id: State.all.sample.id,
                            country_id: Country.first.id,
                            zip_code: Faker::Address.zip )

  Profile.create( user_id: user.id,
                            phone_number: Faker::PhoneNumber.cell_phone,
                            billing_address_id: address.id,
                            shipping_address_id: address.id )

  UserAddress.create( user_id: user.id,
                                      address_id: address.id )

  product = Product.create( title: Faker::Commerce.product_name,
                            description: Faker::Hipster.paragraph,
                            price: Faker::Commerce.price,
                            sku: Faker::Code.isbn,
                            category_id: Category.all.sample.id )

  order = Order.create(user_id: user.id)

  OrderProduct.create(order_id: order.id, product_id: product.id)

  shipment = Shipment.create(shipping_address_id: address.id)

  ShipmentOrder.create(shipment_id: shipment.id, order_id: order.id)

  shopping_cart = ShoppingCart.create(user_id: user.id)

  ShoppingProduct.create(shopping_cart_id: shopping_cart.id, product_id: product.id)
end
