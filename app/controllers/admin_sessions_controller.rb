class AdminSessionsController < ApplicationController
	def create
		admin = Admin.authenticate(params[:password])
		if admin
			session[:admin_id] = admin.id
			redirect_to admin_top_path
		else
			flash.alert = "パスワードが違います"
		end
	end

	def destroy
		session.delete(:admin_id)
		redirect_to :root
	end
end
