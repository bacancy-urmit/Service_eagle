# frozen_string_literal: true

# this will create new user and add a role to it as servicecenter_admin
class ServiceCenterAdminsController < ApplicationController
  before_action :authenticate_user!

  def index
    @count = ServiceCenterCapacity.find_by('date', Date.tomorrow)
    begin
      service_center_id = current_user.user_servicecenter.service_center.id
    rescue StandardError
      @service_center_admin = User.service_center_admins
    end
  end

  def show_pending_appointments
    service_center_id = current_user.user_servicecenter.service_center.id
    @pending_services = BookedAppointment.active_services.where('service_center_id =?', service_center_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_parameters)
    if UserServicecenter.exists?(service_center_id: params[:service_center_id])
      redirect_to new_service_center_admin_path, alert: 'you can not create more than one admin'
    else
      @user.user_servicecenters.build(service_center_id: params[:service_center_id])
      flash.alert = if @user.save
                      @user.add_role :servicecenter_admin
                      'service center admin created successfully'
                    else
                      'service center admin is not created!!!'
        end
      redirect_to new_service_center_admin_path
    end
  end

  def edit
    @service_center_admin = User.find(params[:id])
  end

  def update
    @service_center_admin = User.find(params[:id])
    @service_center_admin.update(allowed_parameters)
    flash.alert = 'admin record is updated'
    redirect_to service_center_admins_path
  end

  def show
    @service_center_admin = User.find(params[:id])
  end

  def destroy
    @service_center_admin = User.find(params[:id])
    @service_center_admin.destroy
    flash.alert = 'service center admin deleted successfully'
    redirect_to service_center_admins_path
  end

  private

  def allowed_parameters
    params.require(:user).permit %i[firstname lastname username contact email
                                    password password_confirmation]
  end
end
