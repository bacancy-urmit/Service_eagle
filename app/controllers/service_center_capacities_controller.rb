# frozen_string_literal: true

class ServiceCenterCapacitiesController < ApplicationController
  before_action :authenticate_user!
  def new
    @servicecenter = current_user.user_servicecenter.service_center.name
    @set_count = ServiceCenterCapacity.new
  end

  def index
    @servicecenter = current_user.user_servicecenter.service_center.id
    @count = ServiceCenterCapacity.find_by(service_center_id: @servicecenter)
  end

  def create
    @set_count = ServiceCenterCapacity.new(allowed_parameter)
    @servicecenter = current_user.user_servicecenter.service_center.id
    @set_count.service_center_id = @servicecenter
    if @set_count.save
      flash.alert = 'count set successfully'
      redirect_to service_center_admins_path
    else
      flash.alert = 'count not set successfully'
    end
  end

  def edit
    @count = ServiceCenterCapacity.find(params[:id])
  end

  def show
    @count = ServiceCenterCapacity.find(params[:id])
  end

  def update
    @count = ServiceCenterCapacity.find(params[:id])
    @count.update(allowed_parameter)
    flash.alert = 'updated successfully'
    redirect_to service_center_capacities_path
  end

  def destroy
    @count = ServiceCenterCapacity.find(params[:id])
    @count.destroy
    flash.alert = 'deleted successfully'
    redirect_to service_center_capacities_path
  end

  private

  def allowed_parameter
    params.require(:service_center_capacity).permit(:count, :date)
  end
end
