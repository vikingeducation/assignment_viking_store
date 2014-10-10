class Order < ActiveRecord::Base
	belongs_to :user
	has_many :products
	has_many :categories

	
end
