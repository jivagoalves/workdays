class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:success] = "Task added successfully!"
      redirect_to tasks_path
    else
      render "new"
    end
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path
  end

end
