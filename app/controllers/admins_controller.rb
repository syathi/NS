class AdminsController < ApplicationController
	before_action :set_admin, only: [:edit_pass, :edit_pass_staff, :update, :show]

  def show
  end

	def edit_pass
    sss
	end

	def edit_pass_staff
	end

	def update

    if @admin.update(admin_params)
      redirect_to admin_top_path, notice: '更新しました。'
      #format.json { render :show, status: :ok, location: @admin }
    else
      render admin_top_path, notice: '入力に誤りがあります'
      #format.json { render json: @admin.errors, status: :unprocessable_entity }
    end
  end

  	def secret_ques
  	end

  	private
  	def set_admin
  		@admin = Admin.find(1)
  	end
    
    def admin_params
      params[:admin].permit(:adminPass, :staffPass, :secretQues, :secretAns)
    end
end

