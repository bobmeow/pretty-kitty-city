class FriendshipInteractionsController < ApplicationController

  # def create
  #   byebug
  #   @friendship_interactions = FriendshipInteraction.create(kind: params[:kind], friendship_id: params[:id])
  #   set_pet
  #   set_current_user
  #   if @pet.owner == @user
  #     @pet.mood_level += 1
  #     @pet.save
  #   else
  #     @user.caramel_points += 1
  #     @user.save
  #   end
  #   redirect_to @pet
  # end

  def create
    set_pet
    @friendship_interactions = FriendshipInteraction.create(kind: params[:kind], friendship_id: params[:id])
    set_current_user
    if params[:kind] == "scratch"
      scratch
    elsif params[:kind] == "play"
      play
    end
    @user.save
    redirect_to @pet
  end

  def scratch
    @user.caramel_points += 1
    flash[:notice] = "Purr!!! Thank you for scratching me! I'm giving you 1 Caramel Point."
  end

  def play
    @user.caramel_points += 2
    flash[:notice] = "Purr!!! Thank you for playing with me! You've earned 2 Caramel Points."
  end


  def self.delete_if_outdated
    FriendshipInteraction.where("created_at < ?", 3.days.ago).destroy_all
  end

end
