class UsersController < ApplicationController 
  class NotAuthorizedError < StandardError; end
  
  before_filter :authorize

  def index
    @users = User.all
  end  
  
  private
  
  def authorize
    if session[:user_id]
      @authorized_user = User.find(session[:user_id])
    else
      raise NotAuthorizedError
    end
  end
end
