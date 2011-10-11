class SpentTimesController < ApplicationController
  before_filter :authenticate
  before_filter :correct_user
  before_filter :redirect_to_edit_task_path, :only => [:index]
  
  def new
    respond_to do |format|
      format.html { redirect_to_edit_task_path }
      format.js do
        @task = Task.find_by_id(params[:task_id])
        @spent_time = SpentTime.new
      end
    end
  end

  def create
    @task = Task.find_by_id(params[:task_id])
    @spent_time = @task.spent_times.build(params[:spent_time])
    if @spent_time.save
      flash[:success] = "Spent time added successfully!" unless request.xhr?
    end
    
    respond_to do |format|
      format.html do
        if @spent_time.errors.any?
          render 'tasks/edit'
        else
          redirect_to edit_task_path(@task)
        end
      end
      format.js
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @spent_time = SpentTime.find_by_id(params[:id])
    @task = @spent_time.task
    if @spent_time.destroy
      flash[:success] = "Spent time deleted successfully!" unless request.xhr?
      redirect_to edit_task_path(@spent_time.task)
    else
      render 'tasks/edit'
    end
  end
  
  private
  
  def belongs_to_current_user?(task)
    current_user.tasks.include?(task)
  end

  def correct_user
    task = Task.find_by_id(params[:task_id])
    redirect_to signout_path unless belongs_to_current_user?(task)
  end

  def redirect_to_edit_task_path
    task = Task.find_by_id(params[:task_id])
    redirect_to edit_task_path(task)
  end

end
