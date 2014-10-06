class Product < ActiveRecord::Base
  def self.products_since(interval=nil)
  # return a count of users over an internal of time
    if interval
      Product.where("created_at > ?", interval).count
    else
      Product.count
    end
  end
end
