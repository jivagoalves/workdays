class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to WorkDays!"
      redirect_to tasks_path
    else
      render "new"
    end
  end
  
end
