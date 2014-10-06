class User < ActiveRecord::Base

  def self.users_since(interval=nil)
    # return a count of users over an internal of time
    if interval
      User.where("created_at > ?", interval).count
    else
      User.count
    end
  end

end
