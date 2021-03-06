class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:user_id]) if User.exists? && session[:user_id] 
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      flash[:notice] = "로그인을 하셔야 게시판 사용이 가능합니다."
      redirect_to '/login'
    end
  end
end
