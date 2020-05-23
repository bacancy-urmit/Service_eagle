# frozen_string_literal: true

class AddBookedAppointmentToUsedSparepart < ActiveRecord::Migration[6.0]
  def change
    add_reference :used_spareparts, :booked_appointment, foreign_key: true
  end
end
