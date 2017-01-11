class PetsController < ApplicationController
  def index
    if !current_user.nil?
      @pets = Pet.all
    else
      redirect_to '/login'
    end
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
    if authorize_user
    else
      set_pet
      @user = User.find(current_user)
      @people_friends = @pet.people_friends
    end
  end


  def update
    set_pet
    @pet.people_friends << User.find(current_user)
    redirect_to @pet
  end

  private

  def pet_params
    params.require(:pet).permit(:name)
  end
end
