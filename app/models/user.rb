class User < ActiveRecord::Base
  before_destroy :delete_carts

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  has_many :credit_cards, dependent: :destroy
  has_many :orders, dependent: :nullify

  # TODO: create last_order association to reduce N+1?
  # has_one :last_order, class_name: 'Order', order: 'checkout_date DESC', limit: 1

  has_many :products, through: :orders

  belongs_to :default_shipping_address, foreign_key: :shipping_id, class_name: 'Address'
  belongs_to :default_billing_address, foreign_key: :billing_id, class_name: 'Address'

  validates :first_name, :last_name, :email, presence: true, length: {in: 1..64}

  scope :day_range, -> (start_day, end_day) {where("created_at >= ? AND created_at <= ?", start_day.days.ago, end_day.days.ago)}

  def name
    "#{first_name} #{last_name}"
  end

  def last_order
    self.orders.completed.order("checkout_date DESC").limit(1).first
  end

  # Join clause to join users with order_totals table
  def self.user_order_totals_join(days_ago = nil)
    "JOIN (#{Order.order_totals_query(days_ago)}) ot ON ot.user_id = users.id"
  end

  # Returns first_name, last_name, revenue for each order
  def self.user_order_totals(days_ago = nil)
    User.select("users.first_name, users.last_name, ot.revenue as amount").joins(user_order_totals_join)
  end

  def self.get_highest_order_user
    user_order_totals.order("amount DESC").limit(1)[0]
  end

  def self.get_highest_aggregation_user(aggregator)
    User.select("users.first_name, users.last_name, #{aggregator}(ot.revenue) as amount").joins(user_order_totals_join).group("users.id").order("amount DESC").limit(1)[0]
  end

  private

  def delete_carts
    self.orders.carts.destroy_all
  end
end
