# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) do |u|
  #     u.permit :username, :email, :password, :password_confirmation
  #   end
  # end

  def after_sign_in_path_for(_resource)
    if current_user.nil?
      new_user_registration_path
    else
      if current_user.has_role? :super_admin
        super_admins_path
      elsif current_user.has_role? :company_admin
        company_admin_index_path
      elsif current_user.has_role? :servicecenter_admin
        service_center_admin_pending_appointments_path
      else
        root_path
      end
    end
  end
end
