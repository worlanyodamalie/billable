class DashboardController < ApplicationController

	def index
		@clients = Client.where(:user => User.find_by(:id => session[:user_id]))

		this_monday = Time.current.beginning_of_week(:monday)
		day_names = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
		@week_days = Hash.new()
		@week_data = User.find_by(:id => session[:user_id]).all_worksessions_of_user
		for i in 0..6
			@week_days[day_names[i]] = this_monday + i.day
		end

		@week_previous_year = (this_monday - 1.week).year
		@week_previous = ((this_monday - 1.week).strftime("%W").to_i + 1)
		@week_today_year = Time.current.year
		@week_today = (Time.current.strftime("%W").to_i + 1)
		@week_next_year = (this_monday + 1.week).year
		@week_next = ((this_monday + 1.week).strftime("%W").to_i + 1)
	end

	def week
		day_names = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
		week = params[:week].to_i
		year = params[:year].to_i
		puts week
		the_monday = Date.commercial(year, week, 1)
		@week_days = Hash.new()
		for i in 0..6
			@week_days[day_names[i]] = the_monday + i.day
		end
		@week_data = User.find_by(:id => session[:user_id]).all_worksessions_of_user

		respond_to do |format|
			format.js
		end
	end

    def dashboard_params
      params.permit(:week)
    end

end
