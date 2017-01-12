class FriendshipInteractionsController < ApplicationController

  def create
    byebug
    @friendship_interactions = FriendshipInteraction.create(kind: "pet", friendship_id: params[:id])
    set_pet
    set_current_user
    if @pet.owner == @user
      @pet.mood_level += 1
      @pet.save
    else
      @user.caramel_points += 1
      @user.save
    end
    redirect_to @pet
  end

end
