def fake_product_category(id: id)
  { id: (id + 1),
    name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph }
end

def generate_product_categories(qty)
  qty.times do |id|
    ProductCategory.create(fake_product_category(id: id))
  end
end

def fake_product(sku: sku)
  { sku: (sku + 1),
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    product_category_id: (rand(5) + 1) }
end

def generate_products(qty)
  qty.times do |sku|
    Product.create(fake_product(sku: sku))
  end
end

def fake_user(id: id, joined: joined)
  { id: (id + 1),
    name: Faker::Name.name,
    email: Faker::Internet.email,
    created_at: joined,
    updated_at: joined }
end

def generate_users(qty)
  fifth = qty/5
  ramp_up_users(qty: fifth,
                min_id: 0,
                start_date: 1.year.ago,
                end_date: 6.months.ago )
  ramp_up_users(qty: fifth,
                min_id: fifth,
                start_date: 6.months.ago,
                end_date: 3.months.ago)
  ramp_up_users(qty: fifth,
                min_id: (fifth * 2),
                start_date: 3.months.ago,
                end_date: 1.month.ago)
  ramp_up_users(qty: fifth,
                min_id: (fifth * 3),
                start_date: 1.month.ago,
                end_date: 1.week.ago)
  ramp_up_users(qty: fifth,
                min_id: (fifth * 4),
                start_date: 1.week.ago,
                end_date: Time.now)
end

def ramp_up_users(qty: qty,
                  min_id: min_id,
                  start_date: start_date,
                  end_date: end_date)
  max_id = min_id + qty - 1
  (min_id..max_id).each do |id|
    joined = Faker::Time.between(start_date,end_date)
    User.create(fake_user(id: id, joined: joined))
  end
end