class Address < ActiveRecord::Base

  def self.get_top_city(num)
    Address.group(:state).select("state, count(state) AS state_count").order("state_count DESC").limit(3)[num].state
  end

  def self.get_top_count(num)
    Address.group(:state).select("state, count(state) AS state_count").order("state_count DESC").limit(3)[num].state_count
  end

end
