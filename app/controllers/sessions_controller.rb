class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session # prevents session fixation attack which tricks usr into using a session id known to the attacker, allowing the attacker to share the seeeession. This resets the session and clears the id before logging the user in
      log_in user
      redirect_to user
    else
      # using flash.now will cause message to disappear after a new request
      flash.now[:danger] = "Invalid email/password combination"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end
end
