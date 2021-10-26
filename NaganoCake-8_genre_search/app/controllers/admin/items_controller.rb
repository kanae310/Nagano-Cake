class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def index
    @items = Item.all
  end
  
  def search
    if params[:name].present?
      @items = Item.where('name LIKE ?', "%#{params[:name]}%")
    else
      @items = Item.none
    end
    render :index
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:item_image,:introduction,:genre_id,:price,:sale_status)
  end
end
