# frozen_string_literal: true

class PaymentsController < ApplicationController
  def search
    @booked_appointment = AppoinmentBooking.find_by(booking_id: allowed_parameter)
  end

  def new; end
end
