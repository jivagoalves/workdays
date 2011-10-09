class UsersController < ApplicationController
  before_filter :authenticate, :except => [:new, :create]
  before_filter :correct_user, :only => [:show, :edit, :update, :destroy]
  # TODO: before_filter :admin_user,   :only => [:destroy]
  before_filter :redirect_if_signed_in, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to WorkDays!"
      redirect_to root_path
    else
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Settings updated successfully!" unless request.xhr?
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
  
  def correct_user
    user = User.find_or_initialize_by_id(params[:id])
    redirect_to(root_path) unless current_user?(user)
  end
  
  # TODO: admin_user
  #def admin_user
  #  redirect_to(root_path) unless current_user.admin?
  #end

  def redirect_if_signed_in
    redirect_to(root_path) if signed_in?
  end
  
end
