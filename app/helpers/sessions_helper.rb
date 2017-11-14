module SessionsHelper

  def login(user)
    session[:id] = @user.id
  end

  # def current_user
  #   p "*" * 100
  #   puts session[:id]
  #   @current_user ||= User.find(session[:id]) if session[:id]
  # end

  def logged_in?
    !!current_user
  end

end
