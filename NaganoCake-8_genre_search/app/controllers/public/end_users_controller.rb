class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  def show
    @user=current_end_user
  end
  
  def edit
     @user=current_end_user
  end
  
  def update
    user=current_end_user
    user.update(user_params)
    redirect_to action: :show
  end
  
  def quit
     @user=current_end_user
  end
  
  def status_update
     user=current_end_user
     user.update(is_valid: false)
     reset_session
     redirect_to root_path
  end
  
  private
  def user_params
    params.require(:end_user).permit(:last_name,:first_name,:last_kana_name,:first_kana_name,:postal_code,:address,:telephone_number,:email)
  end
end
