class QuestionsController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question has been posted"
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      render "users/#{user.id}"
    end
  end

private
  def question_params
    params.require(:question).permit(:query, :user_id)
  end
end
