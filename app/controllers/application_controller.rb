class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class Forbidden < StandardError; end
  include SessionsHelper

  private
  def current_user
  	User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def login_required
  	raise Forbidden unless current_user
  end

  def current_admin
    Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin
  def admin_login_required
    raise Forbidden unless current_admin
  end

  def current_staff
    Staff.find_by(id: session[:staff_id]) if session[:staff_id]
  end
  helper_method
  def staff_login_required
    raise Forbidden unless current_staff
  end
end
