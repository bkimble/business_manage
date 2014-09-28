class UsersController < ApplicationController 
  layout 'admin'
  
  class NotAuthorizedError < StandardError; end
  respond_to :html
  
  before_filter :authorize
  before_filter :load_user, :only => [:show,:edit, :update]

  def index
    @users = User.all
  end  
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Updated user!"
    end
    respond_with @user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
  
  def load_user
    if params[:id]
      @user = User.find(params[:id])
    end
  end
  
  def authorize
    if session[:user_id]
      @authorized_user = User.find(session[:user_id])
    else
      raise NotAuthorizedError
    end
  end
end
