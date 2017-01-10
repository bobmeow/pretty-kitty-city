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
    @user = User.find(current_user)
    @people_friends = @pet.people_friends
  end

  def update
    set_pet
    @pet.people_friends << User.find(current_user)
    redirect_to @pet
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name)
  end
end



def can_friend_pet?
  if true
end



can_friend_pet?
  puts "WHatever"
end
