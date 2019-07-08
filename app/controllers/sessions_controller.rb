class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
        flash[:success] = "you are successfully login"
        redirect_to root_path
    else
      flash[:error] = "Your username/password is incorrect."
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "you are successfully logout"
    redirect_to login_path
  end
  
  private 
  def logged_in_redirect
    if logged_in?
      flash[:success] = "you are already login."
      redirect_to root_path
    end
  end
end