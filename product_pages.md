solution_viking_store
=====================

# Product Pages





## Overview

This assignment was both a large scale refactor and major feature addition to your Viking Store. This is where you Viking Store really starts to resemble a real eCommerce store! You separated all of your admin content into a namespace just for admins and created your user facing views and controllers. You also got the change to implement your own auth! Definitely a major accomplishment with only one project section to go before your store is complete.



## Reviewing Your Solution

While reviewing your code ask the following questions:

* Does your `AdminController` have its own layout? This way all controllers that inherit from it have that layout.
* What approach did you use to ensure you changed all your `form_for`s to be namespaced under `admin`?
* How did you filter your product results by category?
* How did you setup the form to allow category filtering?
* Did you use a raw HTML form? `form_tag`? Did you use a `GET` request to allow the URL to be bookmarked?
* How did you set up your addresses to be created by public users? Did you use the same approach for public users?
* Did you use a callback in your model for shipping/billing? Perhaps `after_create`?
* Did you use nested attributes to allow addresses to be created through the new user form?
* How did you setup your carts to be stored for visitors vs. signed in users?
* How did you merge a cart for a visitor once they signed up or logged in?
* Did you store the data in the session? How did you keep the session in the controller but allow the model to perform CRUD actions on it?
* How did you create validations for your session cart?
* What do your edit cart forms look like by comparison to your edit order forms on your backend?



## Introducing Our Solution

You'll find the files for this solution are outside of the `admin` namespace in your `controllers` and `views` directories. This is because we're now in the public namespace.



## Key Tips and Takeaways

1. **It is perfectly valid to have an admin controller and public controller with the same name.** In fact this is exactly what you want. The difference is in what actions are allowed by each as well as how the routes are setup.

    ```ruby
    Rails.application.routes.draw do

      root 'products#index'
      resources :products, only: [:index, :show]
      resources :sessions, only: [:new, :create, :destroy]
      resources :users, only: [:new, :create, :edit, :update, :destroy]
      resources :orders, only: [:edit, :update, :destroy, :create]
      resources :carts, only: [:edit, :update, :create, :destroy]
      resources :credit_cards, only: [:destroy]


      namespace :admin do
        root 'dashboard#index'
        resources :categories
        resources :products
        resources :addresses, only: [:index]
        resources :orders, only: [:index]
        resources :purchases, only: [:create, :update, :destroy]
        resources :users do
          resources :addresses
          resources :orders
        end
        resources :credit_cards, only: [:destroy]
      end

      #...
    end
    ```

1. **Give your `AdminController` a different layout.** That way when you inherit from it the layout is already set for the child controller.

    ```ruby
    class AdminController < ApplicationController
      layout "admin"
    end
    ```

    ```ruby
    class Admin::UsersController < AdminController
      #...
    end
    ```

1. **Searching and filtering is a time for using `GET` requests.** The reason is because in this case you actually want your params to be shown and bookmarkable in the URL itself. When a `POST` request is sent they are hidden in the body of the request. For a `GET` request they are sent with the URL in a query string after the `?`.

    ```erb
    <form action="<%= products_path %>" method="GET" class="form-inline">
      <div class="form-group">
        <%= select_tag(:products_filter, options_for_select(Category.all.map { |category| [category.name, category.id]}, @filter) , {include_blank: true, prompt: "Filter by Category", :class => "form-control"}) %>
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-swedish btn-submit">Apply Filter</button>
      </div>
    </form>
    ```

1. **Accepting nested attributes for addresses in your `User` model allows you to create addresses from your user form.** This is a huge plus because now you can be certain that once a user is created that you have a usable address for them to place orders.

    ```ruby
    class User < ActiveRecord::Base

      has_many :addresses # don't destroy. want order records!
      
      #...

      # ":reject_if => :all_blank" keeps the blank form from failing validation.
      accepts_nested_attributes_for :addresses,
                                    :allow_destroy => true,
                                    :reject_if => :all_blank

      #...
    end
    ```

    ```erb
    <%= render "shared/errors", :object => @user %>

    <%= form_for @user do |user_fields| %>


      <%= user_fields.fields_for :addresses do |address_fields| %>
        <div class = "panel col-md-6 col-xs-12">
            <div class="form-group">
              <%= address_fields.label :street_address %>
              <%= address_fields.text_field :street_address, {class:"form-control"} %>
            </div>
            <div class="form-group">
              <%= address_fields.label :city_id %>
              <%= address_fields.text_field :city_id, {class:"form-control"} %>
            </div>

            <div class="form-group">
              <%= address_fields.collection_select :state_id, State.all, :id, :name, {prompt: "Pick a State"}, {:class => "form-control"} %>
            </div>

            <div class="form-group">
              <%= address_fields.label :zip_code %>
              <%= address_fields.text_field :zip_code, {class:"form-control"} %>
            </div>

            <div class="form-group">
              <%= user_fields.radio_button :billing_id, address_fields.index %>
              <%= address_fields.label :billing_address %>
            </div>

            <div class="form-group">
              <%= user_fields.radio_button :shipping_id, address_fields.index %>
              <%= address_fields.label :shipping_address %>
            </div>

            <% if address_fields.object.persisted? %>

              <div class="form-group">
                <%= address_fields.check_box :_destroy%>
                <%= address_fields.label :delete %>
              </div>

            <% end %>
        </div>

      <% end %>

    <div class = "panel col-md-6 col-xs-12">

      <div class="form-group">
        <%= user_fields.label :email %>
        <%= user_fields.email_field :email, {class:"form-control"}%>
      </div>

      <div class="form-group">
        <%= user_fields.label :confirm_email %>
        <%= user_fields.email_field :email, {class:"form-control"} %>
      </div>

      <div class="form-group">
        <%= user_fields.label :first_name %>
        <%= user_fields.text_field :first_name, {class:"form-control"} %>
      </div>
      <div class="form-group">
        <%= user_fields.label :last_name %>
        <%= user_fields.text_field :last_name, {class:"form-control"} %>
      </div>

    </div>

    <% if @user.persisted? %>
      <div class = "panel col-md-6 col-xs-12">
        <h3>Submit Changes</h3>
        <%= user_fields.submit "Edit Your Profile", {class: "btn btn-swedish btn-block"} %>
        <%= link_to("Delete my account", user_path(@user.id), method: "delete", data: {confirm: "Do you really want to quit this site when we know where you live and have axes?"})%>
      </div>
    <% else %>
      <div class = "panel col-md-6 col-xs-12">
        <h3>Complete Sign Up</h3>
        <%= user_fields.submit "Sign Up", {class: "btn btn-swedish btn-block"} %>
      </div>

    <% end %>



    <% end %>
    ```

1. **No matter how you implemented your cart for visitors you had to use the session to store the data.** This means either creating some kind of `TempOrder` model to handle operations and set values in the session based on those operations or you might have just put that functionality into the `CartsController`.

    ```ruby
    class CartsController < ApplicationController

      def create
        session[:cart] ||= {}
        item = params[:item]

        if Product.exists?(item) && session[:cart][item]
          session[:cart][item] += 1
          flash[:success] = "Added another to your cart."
        elsif Product.exists?(item)
          session[:cart][item] = 1
          flash[:success] = "#{Product.find(item).name} added to cart!"
        else
          flash[:error] = "Product is invalid"
        end

        # preserves an existing product filter if you have one
        # passed to this action via hidden field
        redirect_to products_path({products_filter: params[:products_filter]})
      end

      def edit
        @cart = session[:cart]
        @total = 0
        if @cart
          @cart.each do |product_id, quantity|
            @total += Product.find(product_id).price * quantity
          end
        end
      end

      def update
        @cart = session[:cart]

        params[:order].each do |product_id, quantity|
          session[:cart][product_id] = quantity.to_i
          session[:cart].delete(product_id) if quantity == ("0" || "")
        end

        if params[:remove]

          params[:remove].each do |product_id, _true|
            session[:cart].delete(product_id)
          end

        end

        flash[:success] = "Updated your order quantities."
        render :edit
      end

      def destroy
        session.delete(:cart)
        flash[:success] = "Cart deleted!"
        redirect_to root_path
      end

    end
    ```


## Good Student Solutions

See this section in the main [README](README.md)

** NOTE:** *This solution repo is copyrighted material for your private use only and not to be shared outside of Viking Code School.*






