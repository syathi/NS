class TopController < ApplicationController
  def index
  end

  def admin_login
  	@admin = Admin.find(1)
  end
end
