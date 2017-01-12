class StoreController < ApplicationController

  def index
    @items = Item.order('price').all
  end

  def create
    
  end

end
