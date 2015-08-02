class DashboardController < ApplicationController

	def index
		@clients = Client.where(:user => User.find_by(:id => session[:user_id]))

		
		@week_data = User.find_by(:id => session[:user_id]).all_worksessions_of_user
		@week_days = generate_week_days
		@initial_navigation_data = { :today_year => Time.current.year, :today_week => Time.current.cweek,
			:previous_year => (Time.current - 1.week).year, :previous_week => (Time.current - 1.week).cweek,
			:next_year => (Time.current + 1.week).year, :next_week => (Time.current + 1.week).cweek }
	end

	def week
		week = params[:week].to_i
		year = params[:year].to_i
		the_monday = Date.commercial(year, week, 1).beginning_of_week
		@week_days = generate_week_days(the_monday)
		@week_data = User.find_by(:id => session[:user_id]).all_worksessions_of_user

		@navigation_data = {
			:today_year => Time.current.year, :today_week => Time.current.cweek,
			:previous_year => (the_monday - 1.week).year, :previous_week => (the_monday - 1.week).cweek,
			:next_year => (the_monday + 1.week).year, :next_week => (the_monday + 1.week).cweek
		}

		respond_to do |format|
			format.js
		end
	end

    def dashboard_params
      params.permit(:week)
    end

    private

    	def generate_week_days(monday=Time.current.beginning_of_week(:monday))
			day_names = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
			temp = Hash.new
			for i in 0..6
				temp[day_names[i]] = monday + i.day
			end
			return temp
    	end

end
