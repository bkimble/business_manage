class UsersController < ApplicationController 
  layout 'admin'
  
  class NotAuthorizedError < StandardError; end
  respond_to :html

  before_filter :load_user, :only => [:show,:edit, :update, :destroy]
    
  before_filter :authorize


  def index
    @users = User.all
  end  
  
  def edit
  end
  
  def new 
    @user = User.new
  end
  
  def create
    if @authorized_user.can?(:create_users)
      @user = User.new(user_params)
      if @user.save
        # Add him to the user who created him
        @authorized_user.subordinates << @user
        @authorized_user.save
        flash[:notice] = "Created user!"
      end
      respond_with @user
    else
      flash[:error] = "You do not have succifient permissions"
      redirect_to :users      
    end
  end
  
  def update
    if @authorized_user.can?(:edit_user, @user)
      if @user.update_attributes(user_params)
        flash[:notice] = "Updated user!"
      end
      respond_with @user
    else
      flash[:error] = "You do not have succifient permissions"
      redirect_to :users            
    end
  end

  def destroy
    if @authorized_user.can?(:delete_user,@user)      
      @user.destroy
    else
      flash[:error] = "You do not have succifient permissions"
    end
    redirect_to :users
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
