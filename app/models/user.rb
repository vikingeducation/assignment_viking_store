class User < ActiveRecord::Base
	
	has_many :addresses
	has_many :orders
	has_many :order_contents, through: :orders
	has_many :ordered_products, 
						through: :order_contents, 
						source: :products

  before_create do |user|
    puts "about to create #{user.name}"
  end
  after_create :just_created

  protected
  def just_created
    puts "just created a user"
  end
end