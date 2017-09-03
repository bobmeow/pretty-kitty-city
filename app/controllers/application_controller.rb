class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_friend_or_owner_of_pet?, :check_owner_of_pet, :check_friend_of_pet, :set_current_user, :set_pet

  private

  def is_friend_or_owner_of_pet?(people_friends, pet)
    check_friend_of_pet(people_friends) || check_owner_of_pet(pet)
  end

  def check_owner_of_pet(pet)
    pet.owner_id == current_user
  end

  def check_friend_of_pet(people_friends)
    people_friends.pluck(:id).include?(current_user)
  end

  def current_user
    session[:user_id]
  end

  def set_current_user
    @user = User.find(current_user)
  end

  def authorize_user
    if !logged_in?
      redirect_to root_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
