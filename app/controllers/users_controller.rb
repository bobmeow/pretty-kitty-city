class UsersController < ApplicationController
  def show
    authorize_user
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @pet = Pet.new
  end

  def create
    @user = User.new(user_params)
    @user.username.downcase!
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_pet_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :name)
  end
end
