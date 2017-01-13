class FriendshipInteractionsController < ApplicationController

  def create
    set_pet
    @friendship_interactions = FriendshipInteraction.create(kind: params[:kind], friendship_id: params[:id])
    set_current_user
    if params[:kind] == "scratch"
      scratch
    elsif params[:kind] == "play"
      play
    elsif params[:kind] == "groom"
      groom
    end
    @user.save
    redirect_to @pet
  end


    def scratch
      @user.caramel_points += 1
      flash[:notice] = "Purr!!!  Thank you for scratching me! I'm giving Caramel Points."
    end

    def play
      @user.caramel_points += 2
      flash[:notice] = "Purr!!! Thank you for playing with me! You've Caramel Points."
    end

    def groom
      @user.caramel_points += 2
        flash[:notice] = "Purr!!! Thank you for grooming me. Have some Caramel Points."
    end



  def play
    @user.caramel_points += 2
    flash[:notice] = "Purr!!! Thank you for playing with me! You've earned 2 Caramel Points."
  end

end
