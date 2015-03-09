class SessionsController < ApplicationController
	def new
	end

	def create
		tab = Tab.find_by(tab_name: params[:session][:tab_name])
		if tab && tab.authenticate(params[:session][:password])
			session[:tab_id] = tab.id
			redirect_to root_path , notice: "Successfully Logged In"
		else
			redirect_to login_path , notice: "Invalid Tabname/Password"
		end
	end

	def destroy
		session[:tab_id] = nil
		redirect_to login_path , notice: "Logged Out"
	end
end
