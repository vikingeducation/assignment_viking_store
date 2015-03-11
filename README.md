The Compleat Viking Store
===========
This solution represents the canonical Viking Code School solution for the 3-week-long Viking Store project. It is an evolving project, so please let us know right away if anything isn't working for you!

##Admin Stuff is Namespaced

As requested in the assignment, everything from Weeks 1 and 2, which represents the Admin CRUD and analytics dashboard functionality, is now namespaced under the `admin/` routes. That means that there's an `Admin::UsersController`, a whole bunch of routes under `namespace :admin`, and countless forms rewritten to look like `form_for [:admin, @user] do |f|`. It was a slog to change all the routes and move all those files, but Rails error messages are a pretty clear guide to what's missing, especially using gems like `better_errors`.

##Filtering Products

The main products page is the centerpiece of the store and requires additional functionality for ease of shopping experience. Users should be able to filter products by category using a simple dropdown list. They do so using a simple form that sends a GET request to the Products Index with an additional `:products_filter` parameter. The Products Index action is set up to expect either a nil or a category ID number for that parameter. If it exists, it uses an ActiveRecord scope to show only products of that category. If it's nil, it shows off everything.

Since adding objects to carts uses a separate controller (see below), it takes additional work to make sure that clicking that button doesn't remove your last filter. You *could* use a `session[:filter]` or a cookie, but it doesn't seem right to make it impossible to see the whole store by refreshing to the Homepage. Instead, a `hidden_field` tag sends the `:products_filter` parameter to the CartsController, where it is passed without modifications as a parameter:`redirect_to products_path({products_filter: params[:products_filter]})`.

**Extra hint:** you need that nested hash to send a custom parameter to a path. `redirect_to products_path(products_filter: params[:products_filter])` does *not* work.


##You Can Have Controllers Without Models
As discussed in the reading, you can have a controller that doesn't hook up to an ActiveRecord model or even a Plain Old Ruby Object. Instead, just create a SessionsController that handles your session sign-ins and redirects.

But what about shopping carts? How do you handle those in your SessionsController without turning your controller code into a spaghetti of conditionals? **You Don't. You build a second controller, CartsController.** Even if both are based on session values, they represent totally different pieces of data to keep track of, which have no reason to crowd each other in the same controller.

##Shopping Carts For Sign-ins
The requirements for this project asked that casual browsers be able to add items to their carts without having to sign in, that returning later in the same browser would keep your shopping cart, and that those items in the cart would not be lost if you then decided to sign in and check out.

That was a multi-step process.

1) Carts are session-based, as alluded to above, no matter whether you're a signed-in user or not. That should happen in a separate `CartsController`, which gets triggered any time you click the "Add to My Cart" button on a Product.
2) That button triggers a `Carts#create` action which does two things: create `session[:cart]` as a blank hash if it doesn't already exist, and use the ID of the item you clicked on (passed in via hidden field on a `form_tag`) to increase the item's value for that ID key by one.
3) Since session variables aren't literally hashes, you can't use tricks like `Hash.new(0)` to set a default 0 amount for a product, so you have to handle the case of a new item manually.
4) When the user finally decides to place an order, a completely separate `OrdersController` process takes over, which forces a login, then merges the session cart with any saved values in the user's unplaced order. In other words, the temporary cart vanishes into thin air, and the more permanent shopping cart in the database gets everything added to it.

##Nested Forms Allow for Users to Build Addresses
Thanks to Rails' `fields_for` methods, it is relatively straightforward (though not simple) to allow a user to create shipping and billing addresses while still creating an account.

All you need to do is build a blank @user for the `#new` action, then make sure the UsersController performs `2.times { @user.addresses.build }`. That way, the `form_for @user` will see two empty Addresses it can then ask you to fill in with the fields inside of a  `<%= user_fields.fields_for :addresses do |address_fields| %>` block.

###Shipping and Billing Address Sneakiness

Take a look at this code. It's a way to set a default shipping address: `<%= user_fields.radio_button :shipping_id, address_fields.index %>`
This radio button actually exists across *all* addresses, so that you can only select one per page. It also finds the actual index ID of the address in the collection `@user.addresses`. It allows you to pass in an additional parameter `:shipping_id` into your controller, even if that address hasn't been persisted yet--it'll be wrong (the first address on the page will have :shipping_id of 0, for example), but you'll be able to transform it in your controller into the right value.

Once in the controller, it calls the following method on any user that successfully saves.

```
  def set_default_addresses
    addresses = params[:user][:addresses_attributes]
    billing = params[:user][:billing_id]
    ...

    if billing
      billing_street = addresses[billing][:street_address]
      @user.billing_address = @user.addresses.find_by(street_address: billing_street)
    end

    @user.save
  end
```

The secret here is that the `billing_id` is actually the index *in `:addresses_attributes`* of the address you chose. Since the addresses have now persisted, you can match them by attributes like street address, then set that address you have found to `@user.billing_address`. This isn't perfect if there are exact duplicates, and might be a good thing to test if you ever wrote an Rspec suite for this assignment, but it provides the user experience asked for with the least overhead on the form itself.

*NOTE: This solution repo is copyrighted material for your private use only and not to be shared outside of Viking Code School.*

