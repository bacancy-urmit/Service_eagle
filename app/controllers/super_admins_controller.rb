# frozen_string_literal: true

# super admin controller which cerates new company admin
class SuperAdminsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_user_parameter)
    @companyadmin=CompanyAdmin.new
    @companyadmin.company_id=params[:company_id]
    @companyadmin.user_id=current_user.id
    if @user.save!
      @user.add_role :company_admin
      redirect_to companies_new_path
    else
      render :error
    end
  end

private

  def allowed_user_parameter
    params.require(:user).permit(:firstname, :lastname, :username, :email, :contact, :password, :password_confirmation)
  end
end
