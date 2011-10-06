class TasksController < ApplicationController
  before_filter :authenticate

  def index
    @tasks = Task.find_all_by_user_id(current_user)
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      flash[:success] = "Task added successfully!"
      redirect_to root_path
    else
      render "new"
    end
  end
  
  def show
    
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

end
