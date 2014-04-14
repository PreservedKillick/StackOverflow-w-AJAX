class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_url
    else
      render 'index'
    end
  end

  def show
    @user = User.find(params:[:id])
  end


private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
