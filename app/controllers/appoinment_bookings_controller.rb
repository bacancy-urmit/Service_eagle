# frozen_string_literal: true

# users service  booking controller
class AppoinmentBookingsController < ApplicationController
  def index
    @opts = if params[:vehicle] == 'two'
              AppoinmentBooking::Two_wheeler
            else
              AppoinmentBooking::Four_wheeler
            end
            @bookedappoinment = AppoinmentBooking.where(user_id: params[:id])
  end

  def new
    @bookappoinment = AppoinmentBooking.new
  end

  def create
    @bookappoinment = AppoinmentBooking.new(allowed_parameter)
    @bookappoinment.user_id = current_user.id
    # @bookappoinment.appoinment_booking.build(service_center_id: params[:service_center_id])
    if @bookappoinment.save
      flash.alert = 'your appoinment is saved'
    else
      flash.alert = 'your appoinment is not saved'
    end
    redirect_to root_path
  end

  def show
    @bookedappoinment = AppoinmentBooking.where(user_id: params[:id])
  end

  def edit
    @bookappoinment = AppoinmentBooking.find(params[:id])
  end

  def update
    @bookedappoinment = AppoinmentBooking.(params[:id])
    @bookedappoinment.update(allowed_parameter)
    flash.alert = 'appoinment is updated'
    redirect_to appoinment_booking_path(current_user.id)
  end

  def destroy
    @bookappoinment = AppoinmentBooking.find(params[:id])
    @bookappoinment.destroy
    flash.alert = 'appoinment deleted'
    redirect_to appoinment_booking_path(current_user.id)
  end

  private

  def allowed_parameter
    params.require(:appoinment_booking).permit(:vehicle_type, :service_center_id, :vehicle_name, :service, :service_date, :pickup_date, :special_request, :service_status, :employee_name, :drop_time, :pickup_time)
  end
end
