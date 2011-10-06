class PagesController < ApplicationController
  
  def home
    if signed_in?
      @tasks = Task.find_all_by_user_id(current_user)
    else
      redirect_to signin_path
    end
  end

end
