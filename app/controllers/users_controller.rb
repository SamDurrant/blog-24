class UsersController < ApplicationController
  def new
    @user = User.new(params[:user])
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # method that displays a temporary messagee
      flash[:success] = "Welcome to Blog 24!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def user_params
      # require :user attribute and only permit the following attributes
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
