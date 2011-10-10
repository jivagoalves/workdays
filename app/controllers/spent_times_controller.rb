class SpentTimesController < ApplicationController
  before_filter :authenticate
  before_filter :redirect_to_root_path, :only => [:new]
  
  def index
    @spent_times = []
    current_user.tasks.each do |t|
      @spent_times += t.spent_times
    end
  end

  def create
    @task = Task.find_by_id(params[:spent_time][:task_id])
    redirect_to signout_path and return unless belongs_to_current_user?(@task)
    
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
    redirect_to signout_path and return unless belongs_to_current_user?(@task)    
    if @spent_time.destroy
      flash[:success] = "Spent time deleted successfully!" unless request.xhr?
    end
    redirect_to edit_task_path(@task)
  end
  
  private
  
  def belongs_to_current_user?(task)
    current_user.tasks.include?(task)
  end

end
