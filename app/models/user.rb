class User < ActiveRecord::Base
	
	has_many :addresses
	has_many :orders
	has_many :order_contents, through: :orders
	has_many :ordered_products, 
						through: :order_contents, 
						source: :products

end