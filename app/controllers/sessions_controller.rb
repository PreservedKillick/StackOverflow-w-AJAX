class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in!"
      redirect_to root_url
    else
      @user = User.new
      flash.now.alert = "Username or password is invalid."
      render "/users/index"
    end
  end

  def destroy
    #user = current_user
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_url
  end

end
