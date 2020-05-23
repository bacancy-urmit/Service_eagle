# frozen_string_literal: true

class ServiceCentersController < ApplicationController
  before_action :authenticate_user!
  def new
    @new_center = ServiceCenter.new
  end

  def index
    @centers = ServiceCenter.all
  end

  def create
    @new_center = ServiceCenter.new(allowed_parameters)
    flash.alert = if @new_center.save
                    'service ceneter creataed succefully'
                  else
                    'service center is not created'
      end
    redirect_to service_centers_path
  end

  def show
    @center = ServiceCenter.find(params[:id])
  end

  def edit
    @center = ServiceCenter.find(params[:id])
  end

  def update
    @center = ServiceCenter.find(params[:id])
    @center.update(allowed_parameters)
    flash.alert = 'service center updated successfully'
    redirect_to service_centers_path
  end

  def destroy
    @center = ServiceCenter.find(params[:id])
    @center.destroy
    flash.alert = 'service center deleted successfully'
    redirect_to service_centers_path
  end

  private

  def allowed_parameters
    params.require(:service_center).permit(:name, :area, :city, :state, :pincode, :email)
  end
end
