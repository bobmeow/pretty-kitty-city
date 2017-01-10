class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :check_friend_or_owner_of_pet

  private

  def check_friend_or_owner_of_pet(people_friends, pet)
    (people_friends.pluck(:id).include? current_user) || (pet.owner_id == current_user)
  end

  def current_user
    session[:user_id]
  end

  def authorize_user
    if !logged_in?
      redirect_to root_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end
end
