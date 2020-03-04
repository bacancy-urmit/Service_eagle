# frozen_string_literal: true

class ServiceCenterCapacitiesController < ApplicationController
  def new
    @set_count = ServiceCenterCapacity.new
  end

  def create
    @set_count = ServiceCenterCapacity.new(allowed_parameter)
    if @set_count.save
      flash[:status] = 'count set successfully'
      redirect_to service_center_admins_path
    else
      flash[:status] = 'count not set successfully'
    end
  end

  private

  def allowed_parameter
    params.require(:service_center_capacity).permit(:count, :date)
  end
end
