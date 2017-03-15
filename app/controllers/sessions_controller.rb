class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.login(params[:username], params[:password])
    if @user
      session[:user] = @user.id
      session[:username] = @user.username
      redirect_to '/'
    else
      redirect_to '/login', alert: "Incorrect Username or password"
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end
end
