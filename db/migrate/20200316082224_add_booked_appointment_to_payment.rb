class AddBookedAppointmentToPayment < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :booked_appointment, foreign_key: true
  end
end
