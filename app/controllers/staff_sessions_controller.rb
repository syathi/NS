class StaffSessionsController < ApplicationController

	def create
		staff = Staff.authenticate(params[:password])
		if staff
			session[:staff_id] = staff.id
			redirect_to :stafftop
		else
			redirect_to :staff_login, notice: "パスワードが違います"
		end
	end

	def destroy
		session.delete(:staff_id)
		redirect_to :root
	end
end
