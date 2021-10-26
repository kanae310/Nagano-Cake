class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id] == nil
       @items = Item.all
    else
       @items = Item.where(genre_id: params[:genre_id])
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
