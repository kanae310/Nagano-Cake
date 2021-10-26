class Public::CartItemsController < ApplicationController
  def create
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
       cart_item =CartItem.find_by(item_id: params[:cart_item][:item_id])
       cart_item.amount=cart_item.amount+(params[:cart_item][:amount]).to_i
      # byebug
       cart_item.update(amount: cart_item.amount)
       redirect_to public_cart_items_path
    else
      cart_item = CartItem.new(cart_params)
      cart_item.end_user_id = current_end_user.id
      cart_item.save
      redirect_to public_cart_items_path
    end
  end
  
  def index
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
  end
  
  def update
    cart_item=CartItem.find(params[:id])
    cart_item.update(cart_params)
    redirect_to public_cart_items_path
  end
  
  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def all_destroy
    cart_items = CartItem.where(end_user_id: current_end_user.id)
    cart_items.destroy_all
     redirect_to public_cart_items_path
  end
  
  private
  def cart_params
    params.require(:cart_item).permit(:amount,:item_id)
  end
end
