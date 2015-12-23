class SessionsController < ApplicationController
	def create
		user = User.authenticate(params[:mail], params[:password])
		if user
			session[:user_id] = user.id
		else
			flash.alert = "メールアドレスとパスワードが一致していません"
		end
		redirect_to :root
	end

	def destroy
		session.delete(:user_id)
		redirect_to :root
	end

	
end
