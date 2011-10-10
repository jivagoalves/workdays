class TasksController < ApplicationController
  before_filter :authenticate
  before_filter :redirect_to_root_path, :only => [:index, :new]
  before_filter :correct_user, :except => [:create]
  
  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      flash[:success] = "Task added successfully!" unless request.xhr?
    end
    
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.js
    end
  end
  
  def show
    # TODO: show a task
  end
  
  def edit
    @task = Task.find_by_id(params[:id])
    @spent_time = SpentTime.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def update
    @task = Task.find_by_id(params[:id])
    if @task.update_attributes(params[:task])
      flash[:success] = "Task updated successfully!" unless request.xhr?
    end
    
    respond_to do |format|
      format.html do
        if @task.errors.any?
          @spent_time = SpentTime.new
          render 'edit'
        else
          redirect_to edit_task_path(@task)
        end
      end
      format.js
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.js
    end
  end
  
  private
  
  def correct_user
    task = Task.find_by_id(params[:id])
    redirect_to signout_path unless current_user.tasks.include?(task)
  end

end
