module SessionsHelper
  def log_in(user)
    # places a temp cookie on the browser containing
    # encrypted user.id expires when browser is closed
    session[:user_id] = user.id
  end

  # returns the current logged-in user
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # returns true if user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end
end
