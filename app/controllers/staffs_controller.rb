class StaffsController < ApplicationController
	before_action :set_staff, only: [:edit, :update]

	def edit #パスワード変更フォームつくる
	end

	def update #パスワード変更をする
		params[:staff].permit(:password, :new_staff_password, :new_staff_password_confirm)
		 #authenticate的な照合をstaffPassでやる->新しいパスワードとその確認が正しいか検証->保存　#だめならそれをお知らせしてリダイレクト
    	@staff = Staff.authenticate(params[:staff][:password])
    	if !@staff.nil?
     		@staff.password = params[:staff][:new_staff_password]
     		if params[:staff][:new_staff_password] == params[:staff][:new_staff_password_confirmation] && @staff.save then
        		redirect_to admin_top_path, notice: 'スタッフのパスワードを更新しました'
      		else
        		redirect_to edit_staff_path(@staff), notice: '新しいパスワードが一致していません'
      		end
    	else
    		redirect_to edit_staff_path(@staff), notice: 'パスワードが間違っています'
    	end
	end

	private

	def set_staff
		@staff = Staff.find(1)
	end

end
