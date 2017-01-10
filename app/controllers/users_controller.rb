class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @pet = Pet.new
  end

  def create
    @user = User.create(user_params)
    redirect_to new_pet_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :name)
  end
end
