class PagesController < ApplicationController
  
  def home
    if signed_in?
      @task  = Task.new
      @tasks = current_user.tasks
      
      respond_to do |format|
        format.html
        format.js { render :nothing => true }
      end
    else
      redirect_to signin_path
    end
  end

end
