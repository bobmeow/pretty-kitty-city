class OwnerInteractionsController < ApplicationController

  def create
    set_pet
    @owner_interactions = OwnerInteraction.create(kind: params[:kind], owner_id: session[:user_id])
    if params[:kind] == "scratch"
      scratch
    elsif params[:kind] == "feed"
      feed
    elsif params[:kind] == "lick"
      lick
    end
    @pet.save
   redirect_to @pet
  end

  def scratch 
    if @pet.mood_level < 15 
    @pet.mood_level += 1   
    flash[:notice] = "Purr!!! Thank you for scratching me! My mood has increased by 1. Previously scratched on #{previous_interaction_time}"
    else
    flash[:notice] = "**bats hand** go away, human!"
    end
  end

   def feed
    if @pet.mood_level < 15
      @pet.mood_level += 2
      flash[:notice] = "Purr!!! Thank you for feeding me! My mood has increased by 2. Previously fed on #{previous_interaction_time}"
     else
      flash[:notice] = "burp! I'm full."
    end
  end

def lick
    if @pet.mood_level > 1
      @pet.mood_level -= 2
      flash[:notice] = "*Pissed Off Cat Noise* This is weird. My mood has decreased by 2. Previously pissed off on #{previous_interaction_time}"
    else
      flash[:notice] = "hissss! This is WEIRD!"
    end
  end

  private

  def previous_interaction_time
    previous_interaction = OwnerInteraction.where(owner_id: session[:user_id]).where(kind: params[:kind]).order(created_at: :desc).second
    if previous_interaction
      formatted_time = previous_interaction.created_at.strftime("%b %d, %I:%M:%p")
    else
      previous_interaction = "never ever before!!!"
    end

    #database is in UTC time, five hours ahead of EST
  end

  def current_interaction_time
    current_interaction = @owner_interactions.created_at
  end

  def time_since_last_interaction
    current_interaction_time - previous_interaction_time
  end



end
