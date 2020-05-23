# frozen_string_literal: true

class AddAppoinmentBookingsToPayment < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :appoinment_bookings, foreign_key: true
  end
end
