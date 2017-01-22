class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :emoji, :price)
  end

end