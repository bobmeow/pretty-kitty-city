class SessionsController < ApplicationController
  def new

  end

  def create
    if !User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
      flash.now.alert = "invalid login credentials"
      redirect_to "/login"
    else
      @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.clear
    redirect_to '/login'
  end
end
