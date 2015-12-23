class AdminSessionsController < ApplicationController
	def create
		admin = Admin.authenticate(params[:password])
		if !admin.nil?
			session[:admin_id] = admin.id
			redirect_to admin_top_path
		else
			redirect_to admin_login_path, notice:"パスワードが違います"
		end
	end

	def destroy
		session.delete(:admin_id)
		redirect_to :root
	end
end
