class AdminController < ApplicationController

	def index
    flash.now[:notice] = "This is a test flash!"
	end

end
