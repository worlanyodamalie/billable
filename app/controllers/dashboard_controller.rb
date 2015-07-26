class DashboardController < ApplicationController

	def index
		@clients = Client.where(:user => User.find_by(:id => session[:user_id]))
	end

end
