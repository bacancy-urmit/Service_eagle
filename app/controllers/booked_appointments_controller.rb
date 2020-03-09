# frozen_string_literal: true

# users service  booking controller
class BookedAppointmentsController < ApplicationController
  def index
    @opts = if params[:vehicle] == 'two'
              BookedAppointment::Two_wheeler
            else
              BookedAppointment::Four_wheeler
            end
    @booked_appoinment = BookedAppointment.where(user_id: current_user.id)
  end

  def new
    @book_appoinment = BookedAppointment.new
  end

  def create
    @book_appoinment = BookedAppointment.new(allowed_parameter)
    current_user.booked_appointments.build
    flash.alert = if @book_appoinment.save
                    'your appoinment is saved'
                  else
                    'your appoinment is not saved'
                  end
    redirect_to root_path
  end

  def show
    @booked_appoinment = BookedAppointment.where(user_id: params[:id])
  end

  def edit
    @book_appoinment = BookedAppointment.find(params[:id])
  end

  def update
    @booked_appoinment = BookedAppointment.call(params[:id])
    @booked_appoinment.update(allowed_parameter)
    flash.alert = 'appoinment is updated'
    redirect_to booked_appointment_path(current_user.id)
  end

  def destroy
    @book_appoinment = BookedAppointment.find(params[:id])
    @book_appoinment.destroy
    flash.alert = 'appoinment deleted'
    redirect_to booked_appointment_path(current_user.id)
  end

  private

  def allowed_parameter
    params.require(:booked_appointment).permit(:vehicle_type, :service_center_id, :vehicle_name, :service, :service_date, :pickup_date, :special_request, :service_status, :employee_name, :drop_time, :pickup_time)
  end
end
