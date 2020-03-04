# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    #  super
    if current_user.nil?
      redirect_to new_user_registration_path
    else
      if current_user.has_role? :super_admin
        redirect_to  super_admins_path
      elsif current_user.has_role? :company_admin
        redirect_to  company_admin_index_path
      elsif current_user.has_role? :servicecenter_admin
        redirect_to service_center_admins_path
      else
        redirect_to root_path
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
