class AccountsController < ApplicationController
	before_action :login_required

	def show
		@user = current_user
		@rsv = Reservation.where("userId = ?", current_user.id)
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
    	respond_to do |format|
      	if @user.update(params[:account].permit(:name, :adress, :tel, :mail, :secretques, :secretans, :password, :password_confirmation))
        	format.html { redirect_to :account, notice: '更新しました' }
        	format.json { render :show, status: :ok, location: @user }
      	else
        	format.html { render :edit }
        	format.json { render json: @user.errors, status: :unprocessable_entity }
      	end
    end
  end
end
