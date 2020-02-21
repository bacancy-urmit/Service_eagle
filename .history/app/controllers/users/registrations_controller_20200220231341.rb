# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # def new
  #   @user=User.new
  # end
  # def create
  #   @user=User.new(sign_up_params)
  #   if @user.save
  #     redirect_to new_user_session_path
  #   else
  #     redirect_to new_user_registration_path
  #   end
  # end
  def after_inactive_sign_up_path_for(resource)
    redirect_to new_user_session_path
  end
  private

  def sign_up_params
    params.require(:user).permit(:firstname,:lastname,:username,:contact,:email,:password,:password_confirmation)
  end
end
