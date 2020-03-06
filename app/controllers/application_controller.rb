# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    byebug
    if current_user.nil?
      new_user_registration_path
    else
      byebug
      if current_user.has_role? :super_admin
        super_admins_path
      elsif current_user.has_role? :company_admin
        company_admin_index_path
      elsif current_user.has_role? :servicecenter_admin
        service_center_admins_path
      else
        root_path
      end
    end
  end
end
