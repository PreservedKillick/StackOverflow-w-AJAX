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
      redirect_to user_path(@user)
    else
      render 'index'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile has been updated!"
      redirect_to user_path(@user)
    else
      render :back
    end
  end


private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
