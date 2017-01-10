class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owner = User.find(current_user)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def show
    set_pet
    @people_friends = @pet.people_friends
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name)
  end
end
