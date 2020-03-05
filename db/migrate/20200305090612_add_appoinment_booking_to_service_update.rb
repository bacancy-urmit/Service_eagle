# frozen_string_literal: true

class AddAppoinmentBookingToServiceUpdate < ActiveRecord::Migration[6.0]
  def change
    add_reference :service_updates, :appoinment_booking, foreign_key: true
  end
end
