class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def login_required
  	redirect_to login_path , alert: "Not logged In"  if current_tab_user.nil?
  end

  def current_tab_user
  	@current_tab_user ||= Tab.find(session[:tab_id]) if session[:tab_id]
  end

  def logged_in?
    !!current_tab_user
  end


end
