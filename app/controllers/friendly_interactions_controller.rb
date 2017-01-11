class FriendlyInteractionsController < ApplicationController

  def create
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
