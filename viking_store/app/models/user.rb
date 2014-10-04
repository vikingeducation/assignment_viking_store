class User < ActiveRecord::Base

  def self.user(time)
    User.where('created_at > ?',time).count
  end
end
