class User < ActiveRecord::Base
	def self.users(time)
		User.where('created_at > ?', time).count
	end

	def self.all_users
		User.count
	end
	
end
