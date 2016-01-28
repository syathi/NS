class AdminTopController < ApplicationController
  def index
  	admin_login_required
  end
end
