class ClothesController < ApplicationController
  before_action :set_clothes, only: [:edit, :update, :destroy, :recommend]

  def index
    @clothes = Clothe.all
  end

  def show
    @clothe = Clothe.find(params[:id])
  end

  def new
    @clothe = Clothe.new
  end

  def edit
  end

  def create
    @clothe = Clothe.new(clothe_params)

    respond_to do |format|
      if @clothe.save
        format.html { redirect_to @clothe, notice: 'clothe was successfully created.' }
        format.json { render :show, status: :created, location: @clothe }
      else
        format.html { render :new }
        format.json { render json: @clothe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @clothe.update(clothe_params)
        format.html { redirect_to @clothe, notice: 'clothe was successfully updated.' }
        format.json { render :show, status: :ok, location: @clothe }
      else
        format.html { render :edit }
        format.json { render json: @clothe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clothe.destroy
    respond_to do |format|
      format.html { redirect_to clothes_url, notice: 'clothe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def recommend #おすすめボタンを押したらrecommendがtrueになる。もう一度押すとfalseになる
      if @clothe.recommend then
        @clothe.update({:recommend => 0})
        redirect_to :clothes, notice: "お勧め解除しました"
      else
        @clothe.update({:recommend => 1})
        redirect_to :clothes, notice: "お勧めしました"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothes
      @clothe = Clothe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clothe_params
      params[:clothe].permit(:name, :sex, :size, :color, :category1, :category2, :state, :value, :note, :recommend, :isLent)
    end
end
