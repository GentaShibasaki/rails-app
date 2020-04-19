class UserController < ApplicationController
  before_action :forbid_login_user, {only:[:top]}
  def initial
    redirect_to("/login")
  end

  def top

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password]
    )
    if @user.save
      flash[:notice] = "ユーザ登録完了しました"
      redirect_to("/")
    else
      render("user/new")
    end
  end

  def login
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/article/index")
    else
      @error_message = "名前またはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render("/user/top")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end
