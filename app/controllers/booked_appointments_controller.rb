# frozen_string_literal: true

# users service  booking controller
class BookedAppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_all_booked_appointments_for_user, only: %i[index]
  before_action :allowed_parameter, only: %i[create update]
  before_action :find_booked_appointment, only: %i[edit update show destroy]

  def new
    @book_appoinment = BookedAppointment.new
  end

  def create
    @book_appoinment = BookedAppointment.new(allowed_parameter)
    @book_appoinment.user_id = current_user.id
    flash.alert = if @book_appoinment.save
                    redirect_to booked_appointments_path(current_user.id)
                    'your appoinment is saved'
                  else
                    render :new
                    'your appoinment is not saved'
                  end
  end

  def show
    @servicecenter = ServiceCenter.find(@book_appoinment.service_center_id)
  end

  def update
    flash.alert = 'appoinment is updated'
    redirect_to booked_appointments_path(current_user.id)
  end

  def destroy
    @book_appoinment.destroy
    flash.alert = 'appoinment deleted'
    redirect_to booked_appointments_path(current_user.id)
  end

  def find_all_booked_appointments_for_user
    @booked_appointments = BookedAppointment.search(params[:booking_id], current_user)
  end

  def allowed_parameter
    params.require(:booked_appointment).permit(:vehicle_type, :service_center_id, :vehicle_name, :service, :service_date, :pickup_date, :special_request, :service_status, :employee_name, :drop_time, :pickup_time)
  end

  private

  def find_booked_appointment
    @book_appoinment = BookedAppointment.find(params[:id])
  end
end
