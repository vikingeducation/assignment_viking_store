class DashboardController < ApplicationController
  def index
    # for the last 7 days: 4 instance vars -
    @week_orders =
    @week_new_users =
    @week_new_products =
    @week_revenue =
  end
end
