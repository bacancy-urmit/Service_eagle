# frozen_string_literal: true

class ServiceUpdatesController < ApplicationController
  def new
    @update = ServiceUpdate.new
  end

  def index
    @updates = ServiceUpdate.where(appoinment_booking_id: params[:id])
  end

  def create
    @update = ServiceUpdate.new(allowed_parameter)
    appoinment = AppoinmentBooking.find_by(token: params[:bookingid])
    @update.appoinment_booking_id = appoinment.id
    flash.alert = if @update.save
        "update saved successfully"
      else
        "update does not save successfully"
      end
    redirect_to service_update_path(@update)
  end

  def edit
    @update = ServiceUpdate.find(params[:id])
  end

  def show
    @update = ServiceUpdate.find(params[:id])
    @appoinment = AppoinmentBooking.find(@update.appoinment_booking_id)
  end

  def update
    @update = ServiceUpdate.find(params[:id])
    @update.update(allowed_parameter)
    flash.alert = "succefully updated"
    redirect_to service_updates_path(@update.id)
  end

  def destroy
    @update = ServiceUpdate.find(params[:id])
    @update.destroy
    flash.alert = "record deleted"
    redirect_to service_updates_path(@update.id)
  end

  private

  def allowed_parameter
    params.require(:service_update).permit(:service_status, :description, :estimation)
  end
end
