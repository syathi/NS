class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy, :freeze]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    att = user_params.permit(:name, :password, :tel, :mail, :adress, :secretans, :secretques)
    @user = User.new(att)

    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def freeze #trueで凍結、falseで凍結じゃない
    if @user.isFreeze then
      @user.update({:isFreeze => 0})
      redirect_to delay_reservations_path, notice: "凍結解除しました"
    else
      @user.update({:isFreeze => 1})
      redirect_to delay_reservations_path, notice: "凍結しました"
    end
  end

  # 検索
  def search
 
  end


  # 会員の秘密の質問
  def secret_question

  end

  # 会員の秘密の質問
  def secret
  end

  def anser
  end

  def password
  end
    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user].permit(:name, :hashed_password, :adress, :tel, :mail, :secretans, :secretques, :isFreeze)
    end
  
end
