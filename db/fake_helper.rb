Faker::Config.locale = 'en-US'

def generate_billing_address(user_id: user_id)
  {
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip_code,
    user_id: user_id
  }
end

def generate_category
  {
    title: Faker::Commerce.department,
    description: Faker::Lorem.pararaph
  }
end

def generate_credit_card(user_id: user_id, billing_address_id: billing_address_id)
  {
    billing_address_id: billing_address_id,
    user_id: user_id,
    expiry_date: Faker::Date.between(Date.today, 1.years.from_now),
    holder_first_name: Faker::Name.first_name,
    holder_last_name: Faker::Name.last_name,
    card_number: Faker::Business.credit_card_number,
    security_code: Faker::Number.number(3)
  }
end

def generate_orders(times)

end

def generate_phone_number(user_id: user_id)
  {
    phone_type: generate_phone_type,
    number: Faker::PhoneNumber.phone_number,
    user_id: user_id
  }
end

def generate_product_category(times)
  times.times do
    ProductCategory.create generate_product_category
end

def generate_product
  {
    name: Faker::Commerce.product_name,
    sku: generate_sku,
    description: Faker::Lorem.paragraph,
    price: Faker::Comerce.price,
  }
end

def generate_shipping_adddress(user_id: user_id)
  {
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip_code,
    user_id: user_id
  }
end

def generate_shopping_cart_product(user_id: user_id)
  {
    user_id: user_id,
    total_cost:
  }
end

def generate_shopping_cart
  {

  }
end

def generate_user_profile
  {
    default_shipping_id:
    default_billing_id:
    default_credit_card:
  }
end

def generate_user
  {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    user_profile_id: UserProfile.all.sample
  }
end

# Helper Methods

def generate_sku
  rand(36**8).to_s(36)
end


def generate_phone_type
  ["work", "mobile", "home"].sample
end
