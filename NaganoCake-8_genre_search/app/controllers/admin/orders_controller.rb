class Admin::OrdersController < ApplicationController
  def index
    @orders=Order.all
  end
  
  def show
    @order=Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end
  
  def update
    order=Order.find(params[:id])
    order.update(status_params)
    if order.status == 'confirm_pay'
       order_details = OrderDetail.where(order_id: params[:id])
       order_details.each do |a|
         a.update(production_status: 'wait_product')
       end
    end
    redirect_to admin_order_path(order)
  end
  
  def status_update
    order_detail=OrderDetail.find(params[:id])
    order_detail.update(production_status_params)
    order = Order.find(order_detail.order_id)
    if order_detail.production_status == 'in_product'
      order.update(status: 'in_production')
    end
    order_details = OrderDetail.where(order_id: order_detail.order_id)
    count=0
    order_details.each do |a|
      if a.production_status== 'producted'
        count += 1
      end
    end

    if count == order_details.count
      order.update(status: 'prepare_ship')
    end
    redirect_to admin_order_path(order_detail.order_id)
    
  end
  
  
  private
  def status_params
     params.require(:order).permit(:status)
  end
  
  def production_status_params
     params.require(:order_detail).permit(:production_status)
  end
end
