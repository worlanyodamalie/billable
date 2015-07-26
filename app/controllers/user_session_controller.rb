class UserSessionController < ApplicationController
	skip_before_action :authorize

	def new
	end

	def create
		user = User.find_by(username: params[:username])
		if user and user.authenticate(params[:password])
			session[:user_id] = user.id
			session[:user_name] = user.name
			redirect_to admin_url
		else
			redirect_to login_url, alert: "Invalid username/password combination"
		end
	end

	def destroy
		session[:user_id] = nil
		session[:user_name] = nil
		redirect_to dashboard_url, notice: "Logged out"
	end
end
