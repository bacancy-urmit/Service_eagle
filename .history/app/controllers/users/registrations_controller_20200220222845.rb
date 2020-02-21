# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user=User.new(sign_up_params)
    if @user.save
      render html:"hello"
      redirect_to new_user_session_path
    else
      redirect_to new_user_registration_path
    end
  end
  private

  def sign_up_params
    params.require(:user).permit(:firstname,:lastname,:username,:contact,:email,:password,:password_confirmation)
  end
end
