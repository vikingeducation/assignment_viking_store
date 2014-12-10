class Address < ActiveRecord::Base

	def self.top_state(num)
		Address.group(:state).select("state, count(state) AS state_count").order("state_count DESC").limit(3)[num].state
	end

	def self.top_state_count(num)
		Address.group(:state).select("state, count(state) AS state_count").order("state_count DESC").limit(3)[num].state_count
	end

	def self.top_city(num)
		Address.group(:city).select("city, count(city) AS city_count").order("city_count DESC").limit(3)[num].city
	end

	def self.top_city_count(num)
		Address.group(:city).select("city, count(city) AS city_count").order("city_count DESC").limit(3)[num].city_count
	end

	belongs_to :user

	validates :street_address, :presence => true
	validates :city,  :presence => true
	validates :state, :presence => true,
	                  format: { with: /[A-Z][A-Z]/ } ,
	                  :length => { is: 2 }
	validates :zip,   :presence => true,
	                  format: { with: /\d{5}(?:[-\s]\d{4})?/ }
	
end
