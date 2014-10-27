class Category < ActiveRecord::Base
  validates :title, :presence => true, 
                    :length => { :minimum => 4,
                                 :maximum => 16,
                               }
	has_many :products
	
end
