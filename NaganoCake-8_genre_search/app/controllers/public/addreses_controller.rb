class Public::AddresesController < ApplicationController
  def index
    @address = Address.new
    @addreses = Address.all
  end
  
  def create
    address = Address.new(address_params)
    address.end_user_id=current_end_user.id
    address.save
    redirect_to public_addreses_path
  end
  
  private
  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end
end
