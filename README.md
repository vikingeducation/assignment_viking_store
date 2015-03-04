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

