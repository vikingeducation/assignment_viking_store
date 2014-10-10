class DashboardController < ApplicationController

	def index
		flash[:notice] = "Everything is alright. You have power over data."
	end

end
