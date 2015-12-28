class AdminsController < ApplicationController
	before_action :set_admin, only: [:edit_pass, :update, :show, :secret_ques]

  def show
  end

	def edit_pass
	end

#	def edit_pass_staff#スタッフモデル作った方が良いかもなのでそうしたら削除
#	end

	def update
    #美しくないので余裕があったら美しくする
    @admin = Admin.authenticate(params[:admin][:password])
    if !@admin.nil?
      @admin.password = params[:admin][:new_password]
      if params[:admin][:new_password] == params[:admin][:new_password_confirmation] && @admin.save then
        redirect_to admin_top_path, notice: '更新しました。'
      else
        redirect_to admin_top_path, notice: '新しいパスワードが一致していません'
      end
    else
      redirect_to admin_top_path, notice: 'パスワードが間違っています'
    end
  end

#  def staff_update#スタッフ用パスワード変更updateアクション #スタッフモデル作った方が良いかもなのでそうしたら削除
#    #authenticate的な照合をstaffPassでやる->新しいパスワードとその確認が正しいか検証->保存　#だめならそれをお知らせしてリダイレクト
#    @admin = Admin.staff_authenticate(params[:admin][:staff_password])
#    if !@admin.nil?
#      @admin.staff_password = params[:admin][:new_staff_password]
#      if params[:admin][:new_staff_password] == params[:admin][:new_staff_password_confirmation] && @admin.save then
#        redirect_to admin_top_path, notice: 'スタッフのパスワードを更新しました'
#      else
#        redirect_to admin_staff_update_path, notice: 'スタッフの新しいパスワードが一致していません'
#      end
#    else
#      redirect_to admin_staff_update_path, notice: 'スタッフのパスワードが間違っています'
#    end
#  end

  def secret_ques
  end

  def secret_ques_check

  end

  private
  def set_admin
  		@admin = Admin.find(1)
  end
    
  def admin_params
    params[:admin].permit(:adminPass, :staffPass, :secretQues, :secretAns)
  end
end

