# frozen_string_literal: true

class UsedSparepartsController < ApplicationController
  before_action :authenticate_user!

  def new
    @used_sparepart = UsedSparepart.new
  end

  # def search
  #   @appoinment_bookig_id = AppoinmentBooking.find_by(params[:booking_id])
  # end

  def index
    @used_spareparts = UsedSparepart.includes(:booked_appointment, :sparepart).search(params[:booking_id])
    @used_spareparts.each do |item|
      @booked_appointment = BookedAppointment.find(item.booked_appointment_id)
      @sparepart = Sparepart.find(item.sparepart_id)
    end
  end

  def create
    @used_sparepart = UsedSparepart.new(allowed_parameter)
    @booked_appointment = BookedAppointment.find_by(token: params[:booking_id])
    @used_sparepart.booked_appointment_id = @booked_appointment.id
    flash.alert = if @used_sparepart.save
                    redirect_to new_used_sparepart_path
                    'record saved successfully!'
                  else
                    'record does not saved successfully'
                    render :new
      end
  end

  def edit
    @sparepart = UsedSparepart.find(params[:id])
    @booked_appointment = BookedAppointment.find(@sparepart.booked_appointment_id)
  end

  def update
    @sparepart = UsedSparepart.find(params[:id])
    @sparepart.update(allowed_parameter)
    flash.alert = 'record updated successfully!'
    redirect_to used_spareparts_path
  end

  def show
    spareparts = UsedSparepart.find(params[:id])
    @booked_appointment = BookedAppointment.find(spareparts.booked_appointment_id)
    @sparepart = Sparepart.find(spareparts.sparepart_id)
  end

  def destroy
    @sparepart = UsedSparepart.find(params[:id])
    @sparepart.destroy
    flash.alert = 'record deleted successfully'
    redirect_to used_spareparts_path
  end

  private

  def allowed_parameter
    params.require(:used_sparepart).permit(:sparepart_id, :quantity, :booking_id)
  end
end
