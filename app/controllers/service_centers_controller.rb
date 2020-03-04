# frozen_string_literal: true

class ServiceCentersController < ApplicationController
  def new
    @new_center = ServiceCenter.new
  end

  def create
    @new_center = ServiceCenter.new(allowed_parameters)
    if @new_center.save
      render :success
    else
      render :error
    end
  end

  def show
    @centers = ServiceCenter.all
  end

  def edit
    @center = ServiceCenter.find(params[:id])
  end

  def update
    @center = ServiceCenter.find(params[:id])
    @center.update(area: params[:service_center][:area], city: params[:service_center][:city], state: params[:service_center][:state], pincode: params[:service_center][:pincode], email: params[:service_center][:email])
    flash.alert = 'service center updated successfully'
    redirect_to service_center_path
  end

  def destroy
    @center = ServiceCenter.find(params[:id])
    @center.destroy
    flash.alert = 'service center deleted successfully'
    redirect_to service_center_path
  end

    private

  def allowed_parameters
    params.require(:service_center).permit(:name, :area, :city, :state, :pincode, :email)
  end
  end
