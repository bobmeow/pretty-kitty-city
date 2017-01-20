class OwnerInteractionsController < ApplicationController

  def create
    set_pet
    owner_interaction_service = OwnerInteractionService.new(params[:kind], session[:user_id], @pet)
    messages = owner_interaction_service.create_and_update_pet_mood_level
    flash[:notice] = messages[:notice]
    flash[:img] = messages[:img_src]
    redirect_to @pet
  end


end
