# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_end_user, only: [:create]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  
   def reject_end_user
     byebug
    @user = EndUser.find_by(email: params[:end_user][:email])
    if @user
      if @user.valid_password?(params[:end_user][:password]) && (@user.is_valid==true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_end_user_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
   end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
 
end