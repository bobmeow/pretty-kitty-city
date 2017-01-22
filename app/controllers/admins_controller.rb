class AdminsController < ApplicationController

  def new
  end

  def create
    if !Admin.find_by(username: params[:user][:username].downcase).try(:authenticate, params[:user][:password])
      flash.now.alert = "invalid login credentials"
      redirect_to "/admin"
    else
      redirect_to admins_homepage_path
    end
  end

  def index
  end

  
end
