class LoginsController < ApplicationController
  def new
    @user = User.new
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to :new_login
  end
  

  def create
    if user = User.authenticate(params[:user][:email])
      session[:user_id] = user.id
      redirect_to users_url
    else
      flash[:error] = "Can't find your login"
      redirect_to :new_login
    end
  end
end
