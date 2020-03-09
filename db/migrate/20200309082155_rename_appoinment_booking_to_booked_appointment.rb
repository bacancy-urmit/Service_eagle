# frozen_string_literal: true

class RenameAppoinmentBookingToBookedAppointment < ActiveRecord::Migration[6.0]
  def change
    rename_table :appoinment_bookings, :booked_appointments
  end
end
