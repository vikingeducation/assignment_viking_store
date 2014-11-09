class Product < ActiveRecord::Base
	def self.products(time)
		Product.where('created_at > ?', time).count
	end

	def self.all_products
		Product.count
	end
	
	belongs_to :category

	has_many   :order_details
	has_many   :orders, through: :order_details

	validates :title, :presence => true, 
                    :length => { in: 1..50 }

  validates :price, :presence => true,
                    :numericality => { :less_than_or_equal_to => 10000 }

end
