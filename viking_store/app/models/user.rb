class User < ActiveRecord::Base

  def self.user_7
    User.where('created_at > ?',1.week.ago).count
  end
end
