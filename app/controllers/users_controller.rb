class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new( user_params )
    if @user.valid?
      @user.save
      session[:user] = @user.id
      session[:username] = @user.username
      redirect_to '/'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
