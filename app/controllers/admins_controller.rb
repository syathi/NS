class AdminsController < ApplicationController
	before_action :set_admin, only: [:edit_pass, :update, :show, :secret_ques, :secret_ques_check, :change_pass, :update_pass]

  def show
  end

	def edit_pass
	end

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

  #秘密の質問フォーム
  def secret_ques
  end

  #秘密の質問照合、正しかったらパスワード編集フォームへ、違ったらもどる
  def secret_ques_check
    @admin = Admin.check_secret_ques(params[:admin][:secretQues], params[:admin][:secretAns])
    if @admin then
      redirect_to change_pass_admin_path
    else
      redirect_to secret_ques_admin_path, notice: '質問もしくは回答が正しくありません'
    end
  end

  #秘密の質問で照合したあとのパスワード編集フォーム
  def change_pass
  end

  #change_passアクションで編集したパスワードを保存する
  def update_pass
      @admin.password = params[:admin][:new_password]
      if params[:admin][:new_password] == params[:admin][:new_password_confirmation] && @admin.save then
        redirect_to :admin_login, notice: '更新しました。新しいパスワードでログインして下さい'
      else
        redirect_to change_pass_admin_path, notice: '新しいパスワードが一致していません'
      end
  end

  private
  def set_admin
  		@admin = Admin.find(1)
  end
    
  def admin_params
    params[:admin].permit(:adminPass, :staffPass, :secretQues, :secretAns)
  end
end

