class ReservationsController < ApplicationController
 before_action :set_reservations, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @carts = Cart.where(user_id: current_user.id)
    @reservation = Reservation.new
  end

  def create
    params[:reservation][:isSend] = false
    @reservation = Reservation.new(reservation_params)
    @clothe = Clothe.find(params[:reservation][:clothesId]) 
    respond_to do |format|
      if @reservation.save
        @clothe.update({:isLent => true})
        Cart.where("user_id = ?", params[:reservation][:userId]).destroy_all
        format.html { redirect_to @reservation, notice: '登録しました' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clothe = Clothe.find(params[:reservation][:clothesId])
    @clothe.update({:isLent => false})
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservation_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  #発送ボタン
  def forword #sendにするとrubyのobjectに定義されているメソッドと被ってエラーするのでforwordにしてます
    @reservation = Reservation.find(params[:id])
    @reservation.update ({:isSend => 1})
   
    redirect_to unsend_reservations_path, notice: "発送しました"
  end

  # 未発送商品一覧
  def unsend
    @reservations = Reservation.where(isSend: false)
  end

  # 予約キャンセル
  def cansel
    @rsv = Reservation.find(params[:id])
    @clothe = Clothe.find(@rsv.clothesId)
    @clothe.update({:isLent => false})
    @rsv.destroy
    respond_to do |format|
      format.html { redirect_to :account, notice: 'キャンセルしました' }
      format.json { head :no_content }
    end
  end

  #未返却商品一覧
  def unreturn
    #発送済みのやつ
    @reservations = Reservation.where(isSend: true)
  end

  def to_return
    @reservation = Reservation.find(params[:id])
    @history = History.new
    @history.attributes = @reservation.attributes
    @history.save
    @reservation.destroy
    redirect_to unreturn_reservations_path, notice: "返却しました"
  end

  # 延滞一覧
  def delay
    nowtime = Date.today
    #puts "#{nowtime}"
    @reservations = Reservation.where("returnDay < ?", nowtime)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservations
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params[:reservation].permit(:userId, :clothesId, :returnDay, :sendDay, :isSend, :sendAdress)
    end
end
