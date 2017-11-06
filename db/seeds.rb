def create_users(amount)
  User.delete_all
  amount.times do
    User.create! do |u|
      u.first_name = Faker::Name.first_name
      u.last_name = Faker::Name.last_name
      u.email = Faker::Internet.free_email
      u.created_at = Faker::Time.backward(365)
      u.updated_at = u.created_at
    end
  end
end

create_users(100)
