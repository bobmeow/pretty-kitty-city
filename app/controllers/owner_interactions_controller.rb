class OwnerInteractionsController < ApplicationController

  def create 
    set_pet
    @pet.mood_level += 1
    @pet.save 
    redirect_to @pet
  end 

end
