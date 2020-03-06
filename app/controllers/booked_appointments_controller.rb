# frozen_string_literal: true

# users service  booking controller
class BookedAppointmentsController < ApplicationController
  def index
    @opts = if params[:vehicle] == 'two'
              AppoinmentBooking::Two_wheeler
            else
              AppoinmentBooking::Four_wheeler
            end
    @booked_appoinment = AppoinmentBooking.where(user_id: params[:id])
  end

  def new
    @book_appoinment = AppoinmentBooking.new
  end

  def create
    @book_appoinment = AppoinmentBooking.new(allowed_parameter)
    current_user.appointment_bookings.build
    flash.alert = if @book_appoinment.save
                    'your appoinment is saved'
                  else
                    'your appoinment is not saved'
                  end
    redirect_to root_path
  end

  def show
    @booked_appoinment = AppoinmentBooking.where(user_id: params[:id])
  end

  def edit
    @book_appoinment = AppoinmentBooking.find(params[:id])
  end

  def update
    @booked_appoinment = AppoinmentBooking.call(params[:id])
    @booked_appoinment.update(allowed_parameter)
    flash.alert = 'appoinment is updated'
    redirect_to appoinment_booking_path(current_user.id)
  end

  def destroy
    @book_appoinment = AppoinmentBooking.find(params[:id])
    @book_appoinment.destroy
    flash.alert = 'appoinment deleted'
    redirect_to appoinment_booking_path(current_user.id)
  end

  private

  def allowed_parameter
    params.require(:appoinment_booking).permit(:vehicle_type, :service_center_id, :vehicle_name, :service, :service_date, :pickup_date, :special_request, :service_status, :employee_name, :drop_time, :pickup_time)
  end
end
