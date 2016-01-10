class TopController < ApplicationController
  def index
  end

  def admin_login
  	@admin = Admin.find(1)
  end

  def search2
  	@params = search_params
  	@clothes = Clothe.all
  	@category1 = search_params[:category1]
  	@category2 = search_params[:category2]
  	@sex = search_params[:sex]
  	@size = search_params[:size]
  	@not_exist = true
  	#redirect_to "top/_search2"
  end

  private
  def search_params
  	params[:page].permit(:category1, :category2, :sex, :size)
  end
end
