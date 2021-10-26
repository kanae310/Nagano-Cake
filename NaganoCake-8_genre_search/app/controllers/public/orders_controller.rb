class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addreses = Address.where(end_user_id: current_end_user.id)
  end
  
  def confirm
    @cart_items=CartItem.where(end_user_id: current_end_user.id)
    if @cart_items.empty?
    else
    @charge="800"
    if params[:order][:select_address] == "0"
       @order=Order.new(order_params)
       @order.postal_code = current_end_user.postal_code
       @order.address = current_end_user.address
       @order.name = current_end_user.first_name + current_end_user.last_name
    elsif params[:order][:select_address] == "1"
       @order=Order.new(order_params)
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    else
       @order=Order.new(order_params)
    end
    end
      
  end
  
  def create
     order=Order.new(order_params)
     order.charge="800"
     order.end_user_id=current_end_user.id
     order.save
     cart_items=CartItem.where(end_user_id: current_end_user.id)
     cart_items.each do |cart_item|
       order_detail=OrderDetail.new
       order_detail.order_id=order.id
       order_detail.amount=cart_item.amount
       order_detail.item_id=cart_item.item_id
       order_detail.purchase_price=cart_item.item.price
       order_detail.save
    end
    cart_items.destroy_all
    redirect_to public_complete_order_path
  end
  
  def complete
  end
  
  def index
  end
  
  def show
  end
  
   private
  def order_params
    params.require(:order).permit(:pay_method,:postal_code,:address,:name,:claim_amount)
  end
end
