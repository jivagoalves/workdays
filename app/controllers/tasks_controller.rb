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

end
