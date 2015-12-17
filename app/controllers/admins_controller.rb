class AdminsController < ApplicationController
	before_action :set_admin, only: [:edit_pass, :edit_pass_staff, :update]

  def edit_pass
  end

  def edit_pass_staff
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def secret_ques
  end

  private
  	def set_admin
  		@admin = Admin.find(1)
  	end
end
