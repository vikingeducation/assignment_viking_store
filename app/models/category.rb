class Category < ActiveRecord::Base

	has_many :products, :dependent => :destroy # why is this not working

end
