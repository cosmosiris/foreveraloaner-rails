module SessionsHelper

  def login(user)
    session[:id] = @user.id
  end

  def logged_in?
    !!current_user
  end

end
