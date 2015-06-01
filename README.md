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


### SEEDING
Seeding the Viking Store
By now, you've spent hours and hours on SQL alone, then more hours learning how to translate it back into ActiveRecord. Hopefully, data models are starting to make more sense for you at this point.

As for this assignment, there were two equally weighty parts to the assignment: setting up the data models in the first place, then seeding them up with useful fake data. This solution will walk through each one separately.

Data Model Planning

You've already had experience planning out the model for a store, so this part of the assignment should have been relatively familiar. Even so, it was more complex than the earlier examples.

Don't Forget Your Join Tables

When you got to the prospect of an Order having many Products in it, but the same Product showing up in multiple Orders, hopefully you realized, Many to Many!

Seeding is Simpler Than You Think

The hardest part about seeding is that there are so many steps. The easiest part is that every single step is something you could have walked through in Rails Console first. seeds.rb is just a Ruby script of things you could have done in Rails Console if you wanted, triggered by the command rake db:seed. (As a matter of fact, keeping Rails Console open for exploratory coding is a really good idea while writing this thing.)

Build Independent Objects Before Dependent Objects

The complicated thing about seeding this database is just making sure you build the right model objects in the right order. For example, if an address is going to have a user_id as part of a has-many relationship, you need to build the users first so you can access those IDs. If you did things in the wrong order, you probably found yourself circling back and adding new IDs to objects later on, which gets very confusing.

The steps of this seeds file roughly look like: - build a



The Admin dashboards for the Viking Store--Solution
=======

If you made it through this assignment, you've built your first Rails app that's actually of use to businesses! You have also written some awfully complex SQL queries for a beginner, and you should feel proud. It is very easy for a self-taught Rails developer never to know quite how ActiveRecord works under the hood, but you are already beginning to understand that everything it does is just a SQL query you could have written by hand.


##A Question Worth Asking
"Which model needs this query method attached?"

**Answer:** The kind of object your class method returns, or the model you're looking for information about.

**Example:** You want a class method to give you all Products that are in a certain Category. That method should be on Product, not on Category, because you are asking a question that gives you a Product back.

```language-ruby
def self.containing_only_category(category)
  joins(:category).where("products.category_id = ?", category.id)
end

# use example
# baked_goods_id = Category.where(:name => "Baked Goods").first.id
# Product.containing_only_category(baked_goods_id)
```

### Remember to use Aliases

You're still doing SQL in the complex queries, so don't forget to alias the results of your calculations. Because Rails is dynamically generating methods on ActiveRecord relations, you will suddenly be able to access those aliases as methods.

Take a close look at the following query (it finds the total cash value of the most expensive order ever placed), and notice that `value` only exists as a working method on the last line because it was aliased into existence on the first line. It *also* exists in your `order` clause to be used in additional SQL. Convenient!

```language-ruby
   select("SUM(order_contents.quantity * products.price) AS value").
      joins("JOIN order_contents ON orders.id = order_contents.order_id JOIN products ON products.id = order_contents.product_id").
      where(:checked_out => true).
      order("value DESC").
      group("orders.id").
      first.
      value
```

###This One View Does Many Things
You are doing a whole lot of different calculations and spitting them out into a single complex view. . .
####So Partialize Your Views
You know this, but it is extra important in a complex dashboard that inevitably loops through a whole lot of pieces.

####(And Also DRY Out Your Variables In the Controller)
This dashboard is unusual because it calls for so many specially-built queries all in one place. Build variables for your data sets to avoid clogging up your views with complex method calls to the model.

```language-ruby
    def index

      ...
      @top_states = User.top_three_states
      @top_cities = User.top_three_cities

      @top_order = User.top_order
      @highest_lifetime = User.highest_lifetime
      @highest_average = User.highest_average_order
      @most_orders = User.most_orders

      ...
    end
```

Further, since you're iterating over the same queries over each day in the last week, as well as other queries over 7, 30, and all-time time frames, you should find a way to DRY that out as well. This solution did so by creating special methods that return an array of results.

```
 # run setup_time_series(0..6) in #index action

 def setup_time_series(day_range)
    @order_days = []
    @daily_revenue = []
    @order_weeks = []
    @weekly_revenue = []

    day_range.each do |x|
      @order_days << Order.orders_on(x)
      @daily_revenue << Order.daily_revenue(x)
      @order_weeks << Order.orders_in(x)
      @weekly_revenue << Order.weekly_revenue(x)
    end

  end
```


The reason for this somewhat confusing code is a victory in the view, where you can just iterate over `@order_days.each` and `@weekly_revenue.each` to get quick access to your results.

###View Tip: the `number_with_precision` method

Since you're saving your numbers as precision floats, you need a way to convert to 2 decimal places if you want to display a dollar amount. Thankfully, there's a pretty slick Rails view helper method to handle that for you. `number_with_precision` takes a number as its first parameter, and then options like `:precision` and `:delimiter` in its options hash, spitting out the number you want in the format you want.

Example:
`<%= number_with_precision( 1232141244.9925803832, :precision => 2, :delimiter => ',') %>` will return `1,232,141,244.99`. Stick a dollar sign on the front, and you're done!




CRUDdy Solution to CRUDdy Store Interfaces
======================

Now you're CRUDding with power.

Welcome to the rest of your Rails career. You will be doing this so many times from here on out. You've done it before, but now you actually have a sense of database objects and associations, backed up with the validations that make your data actually mean something.

Some tips:

- be careful with overzealousness on validations with `:presence => true`
    + if an object could lack that field or association for even a short time during the creation process, you might get into trouble
- if you're validating the length of something, you're validating its presence too
- Remember, the same `form_for` can handle `:new` and `:edit` actions
    + let `new.html.erb` and `edit.html.erb` just point to the same partial


Adminiffic!
===========

You just admin-ed the CRUD out of this assignment. Great job!

This was in many ways similar to the week's assignment, but working with nested resources gave you a couple new things to think about.

## Don't Get Confused About Whose Page It Is
As the mockups guided you to see, a User show page can still have a partial that runs you through that user's addresses, another for their orders, and another for their products. Even with all the extra resources flying around, that's still *their* show-page, and all those extra variables are associations on the main subject of the request. It can be a simple `user_path(@user)` to get to that page, and it makes sense that you want to see a whole user's activity in one place. Thinking in terms of routes and controller actions is a good move whenever you get confused about this sort of thing. Just ask, "What is actually the point of the request, and what are they asking for? What other resources are just additional pieces of information that are tied to that primary resource request?"

##How Did You Solve the Addresses Index Problem?

As the mockup and Pivotal Tracker showed it, Addresses are a nested resource mostly only worth seeing through the lens of the User that owns them. You should be able to look at a User's addresses by visiting `/users/4/addresses`. You should be able to show a particular address by going to a path like `/users/4/addresses/9` -- the show page for an address should have easy access to the information of the user that inputted it. But what about when you put your Admin hat on and need to look at the entire set of addresses? This doesn't seem like something you can solve by just declaring a single set of RESTful routes.

Instead, do it like this:

```language-ruby
# in routes.rb

# the main set of CRUD actions for an address
resources :users do
  resources :addresses
end

# and now we add one more custom route
get '/addresses', 'addresses#index'
```

That way, you can still just visit `/addresses` and have access to a non-user-specific set of addresses.

Further, you can then use the same controller action and the same view to handle both scenarios.

```language-ruby
@user = User.find(params[:user_id])

# verbose way
if @user
  @addresses = @user.addresses
else
  @addresses = Address.all
end

# or for the cool ternary operator one-liner way
@addresses = @user ? @user.addresses : Address.all
```

Done this way, in the view, you don't need any conditionals on rendering the addresses partials, because either way, @addresses is a collection of objects.
The only conditional you need in the view at all is a quick `if` statement to decide whether the heading is 'Addresses' or "Jane Doe's Addresses". You don't even need to write the same `index.html.erb` twice, because Rails is definitely smart enough to check `/app/views/addresses` for your file if you're making a request for an index of addresses, no matter what the route that sent you there.


*NOTE: This solution repo is copyrighted material for your private use only and not to be shared outside of Viking Code School.*

