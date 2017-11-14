class SessionsController < ApplicationController
  include SessionsHelper

  def new
    render :new 
  end
  
  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
     login(@user)
     redirect_to user_path(@user)
    else
      @errors = ["Wrong email or password"]
      render :new
    end
  end

  def logout
    session[:id]= nil
    redirect_to root_path
  end

  def session_params
    params.permit(:email, :password)
  end
end