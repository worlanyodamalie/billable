class DashboardController < ApplicationController

	def index
		@clients = Client.where(:user => User.find_by(:id => session[:user_id]))

		day_names = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
		this_monday = Time.now.beginning_of_week
		@week_days = Hash.new()
		@week_data = Hash.new()
		for i in 0..6
			@week_days[day_names[i]] = this_monday + i.day
		end
	end

end
