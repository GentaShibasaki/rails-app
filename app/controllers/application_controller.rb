class ApplicationController < ActionController::Base

  def authenticate_user
    if session[:user_id] == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if session[:user_id]
      flash[:notice] = "すでにログインしています"
      redirect_to("/article/index")
    end
  end

end
