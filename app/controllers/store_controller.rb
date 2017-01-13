class StoreController < ApplicationController

  def index
    set_current_user
    @items = Item.order('price').all
  end

  def create
    set_current_user
    @item = Item.find(params[:id])
    if @user.caramel_points >= @item.price
      @user.caramel_points -= @item.price
      @user.save
      @user.pet.items << @item
      @user.pet.mood_level += @item.mood_level
      @user.pet.display_gif
      flash[:notice] = ""
      redirect_to @user.pet
    else
      flash[:notice] = "You do not have enough caramel to buy this item."
      @items = Item.order('price').all
      render :index
    end
  end

end
