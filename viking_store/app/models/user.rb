class User < ActiveRecord::Base
	def self.users(time)
		User.where('created_at > ?', time).count
	end

	def self.all_users
		User.count
	end

	def self.user_orders_desc
		User.find(params[:id]).orders.order("created_at DESC")
	end

	has_many :addresses
	has_many :orders
	has_many :credit_cards
	
end
