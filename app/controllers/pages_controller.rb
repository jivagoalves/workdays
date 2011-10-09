class PagesController < ApplicationController
  
  def home
    if signed_in?
      @task  = Task.new
      @tasks = current_user.tasks
    else
      redirect_to signin_path
    end
  end

end
