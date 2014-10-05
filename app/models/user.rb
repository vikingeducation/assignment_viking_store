class User < ActiveRecord::Base

  def self.users_during(interval)
    # return a count of users over an internal of time
    User.where("created_at > ?", interval).count
  end

end
