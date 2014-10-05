class Billing < ActiveRecord::Base
    def self.top_3_states(index)
      @state_name = Billing.select("state, count(user_id) AS usercount").group("state").order("usercount = DESC").limit(3)[index].state
      @user_count = Billing.select("state, count(user_id) AS usercount").group("state").order("usercount = DESC").limit(3)[index].state
      [@state_name, @user_count]
  end

  def self.top_3_cities(index)
      @state_name = Billing.select("city, count(user_id) AS usercount").group(:city).order("usercount = DESC").limit(3)[index].city
      @user_count = Billing.select("state, count(user_id) AS usercount").group("state").order("usercount = DESC").limit(3)[index].city
      [@city_name, @user_count]
end

end
